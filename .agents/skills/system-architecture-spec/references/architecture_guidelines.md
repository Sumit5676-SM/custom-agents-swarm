# System Architecture & SOLID Guidelines for Next.js & Supabase

This reference provides architectural patterns and SOLID principles applied to modern cloud-native web applications.

---

## 1. SOLID Principles Applied to Next.js & Supabase

### S — Single Responsibility Principle (SRP)
- A UI component handles rendering and local user interactions. It must not parse raw database responses or orchestrate business workflows.
- An API adapter in `src/lib/api/` handles fetching and serializing data. It has no knowledge of JSX, CSS, or UI state.
- An Edge Function handles atomic business logic and side effects.

### O — Open/Closed Principle (OCP)
- UI components accept customizable slot props, render props, or polymorphic variants (`asChild` pattern from Radix UI / shadcn/ui) without requiring modifications to the base component code.

### L — Liskov Substitution Principle (LSP)
- All data adapters adhere to strict TypeScript interfaces. A mock API adapter can substitute for a live Supabase adapter in unit tests without breaking client components.

### I — Interface Segregation Principle (ISP)
- Create small, specific interfaces (e.g., `ReceiptListItem`, `ReceiptDetail`, `ReceiptUploadPayload`) rather than forcing components to depend on a massive table row type with 40 unused columns.

### D — Dependency Inversion Principle (DIP)
- High-level presentation components depend on abstract API contracts (`src/lib/api/`), never on concrete database clients or external SDKs.

---

## 2. Docker & Containerization Decision Matrix

| Development Scenario | Docker Required? | Rationale & Tools |
| :--- | :--- | :--- |
| **Local Offline Development** | **Yes** | Running `supabase start` spins up Postgres, GoTrue Auth, PostgREST, Kong, and Storage via Docker. |
| **Branch-based Cloud Development** | **No** | Developers connect to ephemeral Supabase cloud branches (`supabase link --project-ref ...`). |
| **CI/CD Automated Testing** | **Yes (in runner)**| GitHub Actions runs Supabase CLI in Docker to execute automated migration and RLS tests. |
