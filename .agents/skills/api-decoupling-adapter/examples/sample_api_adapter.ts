// File: src/lib/api/expenses.ts
// Decoupled API adapter bridging presentation components to Supabase & Edge Functions

import { createBrowserClient } from '@/lib/supabase/client';
import type {
  ExpenseItem,
  ExpenseReport,
  CreateReportPayload,
  ProcessReceiptPayload,
} from '@/lib/types/expense.types';

export const expenseAdapter = {
  // Read Query: Fetch user's reports (Direct query with RLS)
  async getReports(): Promise<ExpenseReport[]> {
    const supabase = createBrowserClient();
    const { data, error } = await supabase
      .from('expense_reports')
      .select('*')
      .order('created_at', { ascending: false });

    if (error) {
      console.error('[API] getReports error:', error);
      throw new Error('Failed to retrieve expense reports.');
    }
    return data ?? [];
  },

  // Read Query: Fetch line items for a report (Direct query with RLS)
  async getReportItems(reportId: string): Promise<ExpenseItem[]> {
    const supabase = createBrowserClient();
    const { data, error } = await supabase
      .from('expense_items')
      .select('*')
      .eq('report_id', reportId)
      .order('transaction_date', { ascending: false });

    if (error) {
      console.error('[API] getReportItems error:', error);
      throw new Error('Failed to retrieve items for this report.');
    }
    return data ?? [];
  },

  // Simple CRUD: Create a new report draft (Direct query with RLS)
  async createReport(payload: CreateReportPayload): Promise<ExpenseReport> {
    const supabase = createBrowserClient();
    const { data: { user } } = await supabase.auth.getUser();
    if (!user) throw new Error('Authentication required.');

    const { data, error } = await supabase
      .from('expense_reports')
      .insert({
        user_id: user.id,
        title: payload.title,
        description: payload.description,
      })
      .select()
      .single();

    if (error) {
      console.error('[API] createReport error:', error);
      throw new Error('Failed to create expense report.');
    }
    return data;
  },

  // Critical Command: OCR Ingestion & Receipt Extraction (Supabase Edge Function)
  async processReceiptOcr(payload: ProcessReceiptPayload): Promise<ExpenseItem> {
    const supabase = createBrowserClient();
    
    // Upload image to Supabase Storage bucket first
    const fileExt = payload.file.name.split('.').pop();
    const filePath = `${payload.reportId}/${crypto.randomUUID()}.${fileExt}`;
    
    const { error: uploadError } = await supabase.storage
      .from('receipts')
      .upload(filePath, payload.file);

    if (uploadError) {
      console.error('[API] Receipt upload error:', uploadError);
      throw new Error('Failed to upload receipt image.');
    }

    // Invoke the Edge Function using SDK invoke method (handles auth tokens automatically)
    const { data, error: functionError } = await supabase.functions.invoke<ExpenseItem>(
      'process-receipt-ocr',
      {
        body: {
          reportId: payload.reportId,
          storagePath: filePath,
        },
      }
    );

    if (functionError) {
      console.error('[API] processReceiptOcr Edge Function error:', functionError);
      throw new Error(`Receipt analysis failed: ${functionError.message}`);
    }

    if (!data) throw new Error('No expense item returned from OCR processor.');
    return data;
  },

  // Critical Command: Submit Report for Manager Approval (Supabase Edge Function)
  async submitReportForApproval(reportId: string): Promise<{ success: boolean; submittedAt: string }> {
    const supabase = createBrowserClient();
    const { data, error } = await supabase.functions.invoke<{ success: boolean; submittedAt: string }>(
      'submit-expense-report',
      {
        body: { reportId },
      }
    );

    if (error) {
      console.error('[API] submitReportForApproval error:', error);
      throw new Error(`Submission failed: ${error.message}`);
    }
    return data;
  },
};
