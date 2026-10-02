---
name: api-decoupling-adapter
description: Guide for creating decoupled API abstraction layers and contract adapters in Next.js 16+ App Router. Use when structuring src/lib/api/ to isolate UI components from database queries and Supabase Edge Function invocations.
---

# API Decoupling Adapter Pattern

This skill guides the implementation of a decoupled API abstraction layer in `src/lib/api/`. It ensures that user interface components (`src/app/`, `src/components/`) remain purely presentational, completely isolated from direct database drivers, network endpoints, and authentication tokens.

---

## The Decoupled Architecture

```
[UI Components: src/app/ & src/components/]
                     │
                     ▼ Calls typed contract functions
[Decoupled API Adapters: src/lib/api/]
         │                           │
         ▼ (Simple Reads)            ▼ (Commands & Mutations)
[Supabase Client + RLS]     [Supabase Edge Functions]
(src/lib/supabase/client.ts) (supabase.functions.invoke)
```

---

## Core Rules of the Adapter Layer

1. **Strict Isolation**:
   - UI components (`page.tsx`, `*.tsx`) must **never** call `supabase.from(...)` or `fetch(...)` directly.
   - All data fetching and business actions must pass through functions exported from `src/lib/api/`.
2. **Contract-First Typing**:
   - Every adapter function has strict input and return types declared in `src/lib/types/`.
   - Never leak raw PostgREST response shapes (`{ data, error, count, status }`) directly into UI state; normalize data into clean domain models.
3. **Dispatch Routing**:
   - **Simple Reads & Lists**: Adapter queries the Supabase client directly, protected by RLS.
   - **Critical Mutations, Integrations & AI**: Adapter invokes the designated Supabase Edge Function via `supabase.functions.invoke(...)`.

---

## Adapter Implementation Pattern

```typescript
// src/lib/api/expenses.ts
import { createBrowserClient } from '@/lib/supabase/client';
import type { ExpenseItem, CreateExpensePayload } from '@/lib/types/expense.types';

export const expenseApi = {
  // Query: Direct Supabase read with RLS
  async getItemsByReportId(reportId: string): Promise<ExpenseItem[]> {
    const supabase = createBrowserClient();
    const { data, error } = await supabase
      .from('expense_items')
      .select('*')
      .eq('report_id', reportId)
      .order('created_at', { ascending: false });

    if (error) throw new Error(`Failed to load expenses: ${error.message}`);
    return data ?? [];
  },

  // Command: Edge Function invocation for business logic & side effects
  async processReceiptOcr(payload: CreateExpensePayload): Promise<ExpenseItem> {
    const supabase = createBrowserClient();
    const { data, error } = await supabase.functions.invoke<ExpenseItem>('process-receipt-ocr', {
      body: payload,
    });

    if (error) throw new Error(`OCR Processing failed: ${error.message}`);
    if (!data) throw new Error('No data returned from receipt processing');
    return data;
  },
};
```

---

## Detailed References & Examples
- Deep-dive guide: [references/adapter_pattern_guide.md](./references/adapter_pattern_guide.md)
- Complete TypeScript example: [examples/sample_api_adapter.ts](./examples/sample_api_adapter.ts)
