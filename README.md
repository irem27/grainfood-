## im-admin (Next.js)

Admin + public site built with Next.js (App Router), NextAuth and Prisma.

## Local development

1) Install

```bash
npm ci
```

2) Environment

- Copy `.env.example` to `.env` and fill values.
- Required: `DATABASE_URL`, `NEXTAUTH_SECRET`.

3) Prisma

```bash
npx prisma generate
```

If this is a fresh database, create and apply the initial migration (and commit `prisma/migrations`):

```bash
npx prisma migrate dev --name init
```

4) Run

```bash
npm run dev
```

App runs on `http://localhost:5001`.

## Deploy to Vercel

1) Push the repo to GitHub and import it in Vercel.

2) Set Environment Variables in Vercel (Project → Settings → Environment Variables):

- `DATABASE_URL` (PostgreSQL connection string; Vercel Postgres / Prisma Postgres recommended)
- `DIRECT_URL` (optional but recommended for migrations)
- `NEXTAUTH_SECRET` (required; generate a strong random value)
- `NEXTAUTH_URL` (e.g. `https://your-domain.vercel.app`)

3) Build settings

- Build command: default is fine (`npm run build`).
- Prisma Client is generated automatically via `postinstall` (`prisma generate`).

4) Migrations (recommended)

- Create migrations locally and commit `prisma/migrations`.
- Then run `prisma migrate deploy` during deploy (either via a Vercel build command override or a separate CI step).

## Notes

- `prisma/schema.prisma` is configured for PostgreSQL; SQLite is not suitable for Vercel production persistence.
