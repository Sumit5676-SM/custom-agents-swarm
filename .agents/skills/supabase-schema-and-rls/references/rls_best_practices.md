# Supabase Row Level Security (RLS) Best Practices

This guide provides deep technical rules for authoring performant, secure PostgreSQL Row Level Security policies.

---

## 1. Performance Optimization for RLS

### Wrap `auth.uid()` in a Subquery
Writing `using (auth.uid() = user_id)` evaluates the function `auth.uid()` for every single row returned by PostgreSQL, causing sequential scans on large datasets.
**Best Practice**: Wrap the function call in a scalar subselect:
```sql
-- Optimal: Evaluated once per query plan
using ( (select auth.uid()) = user_id )
```

### Always Index Columns Used in RLS Policies
Every column appearing in a `using` or `with check` expression (e.g., `user_id`, `organization_id`, `tenant_id`) **must have a B-tree index**. Without an index, evaluating RLS requires full table scans.

---

## 2. Granular Operations vs Monolithic `ALL`

Avoid `for all` policies whenever mutation rules differ from read rules.
- **`SELECT`**: Governs what rows are visible (`using` clause).
- **`INSERT`**: Governs what rows can be created (`with check` clause).
- **`UPDATE`**: Governs what rows can be targeted (`using`) and what the resulting row must look like (`with check`).
- **`DELETE`**: Governs what rows can be removed (`using` clause).

---

## 3. Storage Bucket Security Policies

Storage objects in Supabase live in `storage.objects` and are also protected by RLS:
```sql
-- Allow users to upload receipts to their own folder: receipts/<user_id>/<filename>
create policy "Users can upload own receipts"
  on storage.objects
  for insert
  to authenticated
  with check (
    bucket_id = 'receipts'
    and (storage.foldername(name))[1] = (select auth.uid())::text
  );
```
