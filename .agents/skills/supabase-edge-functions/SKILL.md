---
name: supabase-edge-functions
description: Guide for implementing and invoking Deno TypeScript Edge Functions in Next.js applications. Use when writing edge function business logic, third-party integrations, webhook handlers, and AI orchestration. Refer to supabase for general platform runtime settings.
---

# Supabase Edge Functions

Supabase Edge Functions are serverless Deno TypeScript functions executing globally close to users. They serve as the secure execution environment for business commands, third-party secrets, AI model orchestration, and webhooks.

---

## When to Use Edge Functions vs Direct Queries

| Operation Type | Architecture Choice | Rationale |
| :--- | :--- | :--- |
| **Simple Reads & Filters** | **Direct Supabase Query** | High performance, cached by PostgREST, secured by Postgres RLS. |
| **Basic Draft CRUD** | **Direct Supabase Query** | Lower latency, zero function cold start, protected by RLS `with check`. |
| **Third-Party API Integration** (OCR, Stripe, Twilio) | **Supabase Edge Function** | Protects API secret keys; clients never talk to third parties directly. |
| **Complex Business Workflow** (Status transitions, Multi-table atomic writes) | **Supabase Edge Function** | Enforces transactional consistency and business validation rules. |
| **AI / LLM Orchestration** | **Supabase Edge Function** | Manages prompt templates, token streaming, and embedding generation. |
| **Inbound Webhooks** | **Supabase Edge Function** | Handles raw signature verification and payload normalization. |

---

## Invocation Standard: SDK `invoke()` vs Raw `fetch()`

> [!IMPORTANT]
> **Always use `supabase.functions.invoke(...)` rather than raw browser `fetch()`.**
> 
> The SDK automatically attaches the active user's authorization JWT (`Bearer <access_token>`), manages URL resolution, and unmarshals JSON responses cleanly.

```typescript
// Correct SDK Invocation
const { data, error } = await supabase.functions.invoke('process-receipt-ocr', {
  body: { reportId, storagePath },
});
```

---

## Edge Function Structure (Deno)

Every Edge Function lives in its own subdirectory under `supabase/functions/<function-name>/index.ts`:

1. **Standard CORS Handling**: Must handle `OPTIONS` preflight requests cleanly.
2. **Authentication Verification**: Verify caller's JWT using `supabase.auth.getUser()`.
3. **Environment Secrets**: Access secret keys securely via `Deno.env.get('SERVICE_SECRET')`.

---

## Detailed References & Examples
- Deep-dive guide: [references/edge_function_patterns.md](./references/edge_function_patterns.md)
- Complete Deno Edge Function: [examples/sample_edge_function.ts](./examples/sample_edge_function.ts)
