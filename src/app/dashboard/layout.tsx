import { redirect } from "next/navigation";
import type { Metadata } from "next";
import AdminSidebar from "@/components/admin/AdminSidebar";
import { auth } from "@/lib/auth";

export const metadata: Metadata = {
  title: "Admin Panel | Alamira",
  description: "Alamira Admin Panel - İçerik Yönetim Sistemi",
};

export default async function DashboardLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const session = await auth();
  if (!session) {
    redirect("/login");
  }

  return (
    <div className="flex min-h-screen bg-slate-100">
      <AdminSidebar />
      <main className="flex-1 overflow-auto">
        <section className="p-6 lg:p-8">
          {children}
        </section>
      </main>
    </div>
  );
}
