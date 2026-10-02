// File: supabase/functions/process-receipt-ocr/index.ts
// Deno Edge Function for automated receipt image OCR parsing & expense item creation

import { createClient } from 'jsr:@supabase/supabase-js@2';

const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

Deno.serve(async (req) => {
  // 1. Handle CORS Preflight
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders });
  }

  try {
    // 2. Validate Authorization
    const authHeader = req.headers.get('Authorization');
    if (!authHeader) {
      return new Response(JSON.stringify({ error: 'Missing Authorization header' }), {
        status: 401,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      });
    }

    const supabaseUrl = Deno.env.get('SUPABASE_URL')!;
    const supabaseAnonKey = Deno.env.get('SUPABASE_ANON_KEY')!;
    const supabaseServiceKey = Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')!;

    // User client (respects RLS)
    const userClient = createClient(supabaseUrl, supabaseAnonKey, {
      global: { headers: { Authorization: authHeader } },
    });

    const { data: { user }, error: authError } = await userClient.auth.getUser();
    if (authError || !user) {
      return new Response(JSON.stringify({ error: 'Unauthorized caller' }), {
        status: 401,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      });
    }

    // 3. Parse Request Payload
    const { reportId, storagePath } = await req.json();
    if (!reportId || !storagePath) {
      return new Response(JSON.stringify({ error: 'reportId and storagePath are required' }), {
        status: 400,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      });
    }

    // 4. Verify Ownership of Target Report
    const { data: report, error: reportError } = await userClient
      .from('expense_reports')
      .select('id, user_id, status')
      .eq('id', reportId)
      .single();

    if (reportError || !report || report.user_id !== user.id) {
      return new Response(JSON.stringify({ error: 'Report not found or permission denied' }), {
        status: 403,
        headers: { ...corsHeaders, 'Content-Type': 'application/json' },
      });
    }

    // 5. Simulate External Vision OCR Processing
    // (In production, forward image buffer to Google Cloud Vision or AWS Textract)
    const simulatedOcr = {
      merchantName: "Giotto's Italian Bistro",
      transactionDate: new Date().toISOString().split('T')[0],
      amount: 145.20,
      currency: "USD",
      category: "Meals & Entertainment",
      confidence: 0.96,
    };

    // 6. Insert Expense Item using Admin Service Client
    const adminClient = createClient(supabaseUrl, supabaseServiceKey);
    const { data: expenseItem, error: insertError } = await adminClient
      .from('expense_items')
      .insert({
        report_id: reportId,
        merchant_name: simulatedOcr.merchantName,
        transaction_date: simulatedOcr.transactionDate,
        amount: simulatedOcr.amount,
        currency: simulatedOcr.currency,
        category: simulatedOcr.category,
        receipt_storage_path: storagePath,
        ocr_extracted_data: simulatedOcr,
      })
      .select()
      .single();

    if (insertError) {
      throw insertError;
    }

    // 7. Return Successful DTO
    return new Response(JSON.stringify(expenseItem), {
      status: 200,
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    });
  } catch (err) {
    console.error('[EdgeFunction] Error:', err);
    return new Response(JSON.stringify({ error: (err as Error).message }), {
      status: 500,
      headers: { ...corsHeaders, 'Content-Type': 'application/json' },
    });
  }
});
