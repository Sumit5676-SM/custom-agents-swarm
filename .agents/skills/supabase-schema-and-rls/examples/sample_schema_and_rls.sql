-- Migration: Initial Schema & RLS for Expense Management System
-- File: supabase/migrations/20261001000000_init_expenses.sql

-- Enable required extensions
create extension if not exists "uuid-ossp";

-- 1. Create Enums
create type expense_status as enum ('draft', 'submitted', 'approved', 'rejected', 'reimbursed');

-- 2. Expense Reports Table
create table public.expense_reports (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null references auth.users(id) on delete cascade,
  title text not null,
  description text,
  status expense_status not null default 'draft',
  total_amount numeric(12, 2) not null default 0.00,
  currency text not null default 'USD',
  submitted_at timestamptz,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- Indexing
create index idx_expense_reports_user_id on public.expense_reports(user_id);
create index idx_expense_reports_status on public.expense_reports(status);

-- 3. Expense Items Table
create table public.expense_items (
  id uuid primary key default gen_random_uuid(),
  report_id uuid not null references public.expense_reports(id) on delete cascade,
  merchant_name text not null,
  transaction_date date not null default current_date,
  amount numeric(10, 2) not null,
  currency text not null default 'USD',
  category text not null,
  receipt_storage_path text,
  ocr_extracted_data jsonb,
  attendees text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

-- Indexing
create index idx_expense_items_report_id on public.expense_items(report_id);

-- 4. Enable Row Level Security
alter table public.expense_reports enable row level security;
alter table public.expense_items enable row level security;

-- 5. RLS Policies: Expense Reports
create policy "Users can view own reports"
  on public.expense_reports for select to authenticated
  using ( (select auth.uid()) = user_id );

create policy "Users can insert own reports"
  on public.expense_reports for insert to authenticated
  with check ( (select auth.uid()) = user_id );

create policy "Users can update own draft reports"
  on public.expense_reports for update to authenticated
  using ( (select auth.uid()) = user_id and status = 'draft' )
  with check ( (select auth.uid()) = user_id );

create policy "Users can delete own draft reports"
  on public.expense_reports for delete to authenticated
  using ( (select auth.uid()) = user_id and status = 'draft' );

-- 6. RLS Policies: Expense Items
create policy "Users can view items in own reports"
  on public.expense_items for select to authenticated
  using (
    exists (
      select 1 from public.expense_reports
      where expense_reports.id = expense_items.report_id
      and expense_reports.user_id = (select auth.uid())
    )
  );

create policy "Users can insert items into own draft reports"
  on public.expense_items for insert to authenticated
  with check (
    exists (
      select 1 from public.expense_reports
      where expense_reports.id = expense_items.report_id
      and expense_reports.user_id = (select auth.uid())
      and expense_reports.status = 'draft'
    )
  );
