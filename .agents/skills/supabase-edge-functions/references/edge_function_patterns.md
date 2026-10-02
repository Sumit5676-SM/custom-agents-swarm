# Supabase Edge Function Patterns & Best Practices

This guide details serverless patterns for writing resilient Deno Edge Functions in Supabase.

---

## 1. Standard CORS Boilerplate

Browsers will block cross-origin requests unless the Edge Function responds with proper CORS headers:

```typescript
export const corsHeaders = {
  'Access-Control-Allow-Origin': '*',
  'Access-Control-Allow-Headers': 'authorization, x-client-info, apikey, content-type',
};

// Handle Preflight
Deno.serve(async (req) => {
  if (req.method === 'OPTIONS') {
    return new Response('ok', { headers: corsHeaders });
  }
  // ... business logic
});
```

---

## 2. Authenticating Callers Inside Edge Functions

To establish the user context inside an Edge Function:
```typescript
import { createClient } from 'jsr:@supabase/supabase-js@2';

const authHeader = req.headers.get('Authorization');
if (!authHeader) {
  return new Response(JSON.stringify({ error: 'Missing Authorization header' }), {
    status: 401,
    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
  });
}

// User-scoped client
const supabaseClient = createClient(
  Deno.env.get('SUPABASE_URL') ?? '',
  Deno.env.get('SUPABASE_ANON_KEY') ?? '',
  { global: { headers: { Authorization: authHeader } } }
);

const { data: { user }, error: authError } = await supabaseClient.auth.getUser();
if (authError || !user) {
  return new Response(JSON.stringify({ error: 'Invalid authentication token' }), {
    status: 401,
    headers: { ...corsHeaders, 'Content-Type': 'application/json' },
  });
}
```
