---
name: system-architecture-spec
description: Guide for architecting scalable cloud-native web systems using Next.js 16+ App Router and Supabase. Use when designing system topology, component and data flow boundaries, Edge Function allocation, API contract structures, and containerization specifications.
---

# System Architecture Specification

This skill guides the design of modern, decoupled web system architectures combining **Next.js 16+ App Router**, **TypeScript**, **Tailwind CSS v4**, **shadcn/ui**, and **Supabase**.

---

## Core Architectural Blueprint Structure

Every system architecture document must specify six foundational pillars:

```
[1. Topology & Technology Stack]
                │
                ▼
[2. Next.js App Router Component Boundaries (RSC vs Client)]
                │
                ▼
[3. Supabase Integration & Edge Function Boundaries]
                │
                ▼
[4. Decoupled API Contract Layer (src/lib/api/ & src/lib/types/)]
                │
                ▼
[5. Local Development & Containerization Specs (Docker / Compose)]
                │
                ▼
      [HALT FOR USER FEEDBACK] ──(Iterate on Feedback)──┐
                │                                       │
                ▼ (On Explicit Approval)                │
[Save Blueprint to artifacts/architecture/] <───────────┘
```

---

## 1. System Topology & Stack Standards
- **Framework**: Next.js 16+ with App Router (`src/app/`).
- **Language**: TypeScript with strict mode enabled.
- **Styling & UI**: Tailwind CSS v4, shadcn/ui components (`src/components/ui/`), Lucide icons.
- **Backend & Persistence**: Supabase (PostgreSQL, Supabase Auth, Storage, Realtime, pgvector, Edge Functions).

---

## 2. Component Boundaries (Server vs Client)
- **React Server Components (RSC)**: Default for layouts, pages, and static wrappers. Use RSC for initial data fetching and streaming skeleton boundaries with `<Suspense>`.
- **Client Components (`'use client'`)**: Leaf-level components requiring interactive browser state, event handlers (`onClick`, `onChange`), browser APIs (camera, geolocation), or Supabase Realtime subscriptions.

---

## 3. Supabase & Edge Function Boundary Rule
- **Supabase Edge Functions (Deno / TypeScript)**:
  - Required for: Critical business writes, payment processing, third-party API calls (e.g., OCR, SMS, Stripe), webhook ingress, background cron tasks, and LLM/AI orchestration.
  - Security: Runs with access to protected secrets; callers invoke via `supabase.functions.invoke(...)`. Never expose service-role keys to clients.
- **Direct Supabase Queries (Postgres + RLS)**:
  - Allowed only for: Simple reads, paginated list fetching, and low-risk user CRUD guarded by strict Row Level Security.

---

## 4. Decoupled API Abstraction Layer
Architect a clean separation of concerns:
- **`src/app/`**: Presentation routes and layouts only.
- **`src/components/`**: Reusable UI components.
- **`src/lib/supabase/`**: Client initializers:
  - `client.ts`: Browser client (`createBrowserClient`)
  - `server.ts`: Server client (`createServerClient` reading cookies)
  - `middleware.ts`: Session refresher
- **`src/lib/api/`**: Decoupled command and query adapters (e.g., `expenses.ts`, `receipts.ts`). **UI components must NEVER invoke Supabase or external APIs directly.**
- **`src/lib/types/`**: Canonical TypeScript interfaces and database row types.

---

## 5. Containerization Specification
Always state explicitly whether **Docker / Docker Compose** is required:
- **Local Supabase via Supabase CLI**: Requires Docker daemon running locally (`supabase start`).
- **Direct Remote Supabase Project**: Does not require Docker if connected directly to a Supabase cloud staging/dev project.

---

## Interactive Rule: Halt for Feedback

Before saving the architecture specification:
1. Present the topology, component boundaries, Edge Function mapping, and API contract design to the user.
2. Ask for feedback: *"Does this system topology, data flow, and Edge Function boundary align with your performance and infrastructure requirements?"*
3. **Wait for user feedback and approval** before saving into `artifacts/architecture/<initiative-name>-architecture.md`.

---

## Detailed References & Examples
- Deep-dive guide: [references/architecture_guidelines.md](./references/architecture_guidelines.md)
- Complete concrete example: [examples/sample_architecture_spec.md](./examples/sample_architecture_spec.md)
