---
name: supabase-schema-and-rls
description: Application domain entity modeling, multi-tenant schema structures, and starter RLS policy templates for Supabase. Use when defining business entities, relationship models, and tenant isolation patterns. Consult supabase-postgres-best-practices for database performance, indexing, and lock avoidance, and supabase for platform security.
---

# Supabase Schema & Row Level Security (RLS)

This skill guides the design of secure, scalable, and normalized PostgreSQL schemas and bulletproof Row Level Security (RLS) policies for Supabase.

---

## Core Modeling Principles

1. **Normalized Relational Design**:
   - Model entities in 3NF with explicit primary keys (`id uuid primary key default gen_random_uuid()`).
   - Define explicit foreign key constraints with appropriate cascade behaviors (`on delete cascade` or `on delete restrict`).
   - Include automatic audit timestamps (`created_at timestamptz default now()`, `updated_at timestamptz default now()`).
2. **Performance Indexing**:
   - Index all foreign key columns and frequently filtered columns (e.g., `user_id`, `organization_id`, `status`).
   - Create composite or partial indexes for common query patterns (e.g., `create index on expenses (report_id, created_at desc)`).
3. **Mandatory Row Level Security (RLS)**:
   - **Always enable RLS on every table**: `alter table <table_name> enable row level security;`.
   - Never rely on client-supplied user IDs in `where` clauses; always anchor policies on `auth.uid()`.
   - Write granular policies for `SELECT`, `INSERT`, `UPDATE`, and `DELETE`.

---

## Standard RLS Policy Templates

### 1. User-Isolated Tables (e.g., Expense Reports)
```sql
-- Enable RLS
alter table public.expense_reports enable row level security;

-- Policy: Users can view their own reports
create policy "Users can view own reports"
  on public.expense_reports
  for select
  to authenticated
  using ( (select auth.uid()) = user_id );

-- Policy: Users can insert their own reports
create policy "Users can insert own reports"
  on public.expense_reports
  for insert
  to authenticated
  with check ( (select auth.uid()) = user_id );

-- Policy: Users can update their own draft reports
create policy "Users can update own draft reports"
  on public.expense_reports
  for update
  to authenticated
  using ( (select auth.uid()) = user_id and status = 'draft' )
  with check ( (select auth.uid()) = user_id );
```

### 2. Parent-Child Relationship Tables (e.g., Expense Items)
```sql
alter table public.expense_items enable row level security;

-- Policy: Users can access items belonging to their reports
create policy "Users can view items in own reports"
  on public.expense_items
  for select
  to authenticated
  using (
    exists (
      select 1 from public.expense_reports
      where expense_reports.id = expense_items.report_id
      and expense_reports.user_id = (select auth.uid())
    )
  );
```

---

## Versioned Migration Workflow

Manage all schema changes via the Supabase CLI:
1. Create new migration file: `supabase migration new <migration_name>`
2. Write clean, idempotent SQL scripts.
3. Test locally with `supabase db reset` or `supabase migration up`.

---

## Detailed References & Examples
- Deep-dive guide: [references/rls_best_practices.md](./references/rls_best_practices.md)
- Complete SQL example: [examples/sample_schema_and_rls.sql](./examples/sample_schema_and_rls.sql)
