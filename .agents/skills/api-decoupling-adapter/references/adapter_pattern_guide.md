# Decoupled API Adapter Pattern Reference Guide

This reference explains the software engineering benefits of the Adapter Pattern in frontend web applications and how to maintain boundary integrity.

---

## 1. Why Decouple the UI from Supabase?

1. **Testability & Mocking**:
   - UI components can be tested in isolation using Jest/Vitest or Storybook simply by mocking `src/lib/api/` rather than mocking complex network requests or database drivers.
2. **Framework & Backend Agnosticism**:
   - If an endpoint transitions from a direct database read to an Edge Function, a GraphQL service, or an external microservice, only the adapter in `src/lib/api/` changes. The 10 different UI components consuming it remain completely untouched.
3. **Consistent Error Normalization**:
   - Centralizes error parsing, logging, and user-friendly error message transformations in one place.

---

## 2. Server vs Client Adapter Usage in Next.js 16+

- **Client Components (`'use client'`)**:
  - Consume adapters that instantiate the browser Supabase client (`createBrowserClient()`).
- **React Server Components (RSC) & Server Actions**:
  - Consume server-specific adapters that instantiate the server Supabase client (`createServerClient()` reading Next.js headers/cookies).
- **Directory Structure Recommendation**:
  ```text
  src/lib/api/
  ├── client/             # Adapters for client components (browser Supabase)
  │   └── expenses.ts
  └── server/             # Adapters for RSC and Server Actions
      └── expenses.server.ts
  ```
