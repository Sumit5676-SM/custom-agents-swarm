# Sample Architecture Specification: Mobile Expense Management System

**Initiative**: Mobile Expense Reporting & OCR Ingestion  
**Inputs Grounding**:  
- Stories: [sample_user_stories.md](file:///Users/sumeetmehta/Projects/custom-agents-swarm/artifacts/user-stories/sample_user_stories.md)  
- Visual Design: [sample_hifi_mockup.html](file:///Users/sumeetmehta/Projects/custom-agents-swarm/artifacts/visual-designs/sample_hifi_mockup.html)

---

## 1. System Topology & Data Flow

```mermaid
sequenceDiagram
  autonumber
  actor User as Employee (Mobile/Desktop)
  participant UI as Next.js 16+ App Router (Client/RSC)
  participant Adapter as src/lib/api/ (Decoupled Layer)
  participant Supabase as Supabase (Postgres & Storage)
  participant Edge as Supabase Edge Functions (Deno)
  participant OCR as External OCR Vision API

  Note over User,UI: 1. User snaps receipt photo
  User->>UI: Snaps photo & confirms "Use Photo"
  UI->>Adapter: uploadReceipt(file, reportId)
  Adapter->>Supabase: Upload image to 'receipts' Storage Bucket
  Supabase-->>Adapter: Return Storage Public/Signed URL
  
  Note over Adapter,Edge: 2. Invoke Business Command
  Adapter->>Edge: supabase.functions.invoke('process-receipt-ocr', { storagePath })
  Edge->>OCR: Send image buffer to OCR Vision Engine
  OCR-->>Edge: Parsed metadata (Merchant, Date, Total, Tax)
  Edge->>Supabase: Insert expense_items row (Service Role inside Edge)
  Edge-->>Adapter: Return normalized ExpenseItem DTO
  Adapter-->>UI: Update reactive UI state with auto-filled fields
```

---

## 2. Component & Directory Layout

```text
src/
├── app/
│   ├── (auth)/login/page.tsx           # Authentication page
│   ├── (dashboard)/reports/page.tsx    # RSC Report list view
│   ├── (dashboard)/reports/[id]/page.tsx # Report detail & expense item manager
│   └── layout.tsx                      # Root layout with fonts & theme provider
├── components/
│   ├── ui/                             # shadcn/ui primitives (button, dialog, input)
│   └── expenses/
│       ├── receipt-scanner-modal.tsx   # Camera capture client component
│       ├── expense-item-row.tsx        # Presentational item card
│       └── category-selector.tsx       # Accessible category picker
├── lib/
│   ├── supabase/
│   │   ├── client.ts                   # createBrowserClient()
│   │   ├── server.ts                   # createServerClient()
│   │   └── middleware.ts               # updateSession()
│   ├── api/
│   │   ├── reports.ts                  # Report queries and mutations
│   │   └── expenses.ts                 # Expense item commands & Edge Function invocations
│   └── types/
│       ├── database.types.ts           # Auto-generated Supabase schema types
│       └── expense.types.ts            # Domain DTOs and command payloads
supabase/
├── config.toml                         # Supabase CLI local project configuration
├── migrations/
│   └── 20261001000000_init_expenses.sql # Initial schema, indexes & RLS policies
└── functions/
    └── process-receipt-ocr/
        └── index.ts                    # Deno Edge Function for OCR processing
```

---

## 3. Local Development & Docker Specification

- **Docker Requirement**: **Required for local development.**
- Developers execute `supabase start` using the Supabase CLI, which requires a running Docker daemon to provision local PostgreSQL, Storage, Auth, and Edge Function containers.
