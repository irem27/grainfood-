"use client";
import Header from '@/components/public/Header';
import Footer from '@/components/public/Footer';
import CookieConsent from '@/components/public/CookieConsent';
import Link from 'next/link';
import { useState } from 'react';
import { usePathname } from 'next/navigation';

const menuItems = [
  { label: "Startseite", href: "/" },
  { label: "Über uns", href: "/about" },
  { label: "Grainfood", href: "/logistics-landing" },
  { label: "Alamira", href: "/alamira-rice" },
  { label: "Kontakt", href: "/contact" },
];

export default function DrawerHeaderLayout({ children }: { children: React.ReactNode }) {
  const [drawerOpen, setDrawerOpen] = useState(false);
  const pathname = usePathname();
  const isHomePage = pathname === "/";

  return (
    <div className="min-h-screen">
      <Header onMenuClick={() => setDrawerOpen(true)} />

      {/* Drawer */}
      {drawerOpen && (
        <div className="fixed inset-0 z-50 flex">
          <div className="absolute inset-0 bg-black/40" onClick={() => setDrawerOpen(false)} />
          <div className="relative bg-white w-80 max-w-full h-full shadow-xl flex flex-col animate-slide-in">
            <div className="flex items-center justify-between px-6 pt-6 pb-2">
              <span className="text-lg font-bold text-gray-900 tracking-wide">Menü</span>
              <button
                className="w-9 h-9 rounded-full bg-gray-100 flex items-center justify-center text-gray-600 hover:bg-gray-200 transition-colors"
                onClick={() => setDrawerOpen(false)}
                aria-label="Menü schließen"
              >
                <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                </svg>
              </button>
            </div>

            <nav className="flex flex-col px-6 py-4 gap-1 flex-1 overflow-y-auto">
              {menuItems.map((item) => (
                  <Link
                    key={item.href}
                    href={item.href!}
                    onClick={() => setDrawerOpen(false)}
                    className={`py-3 px-3 rounded-lg font-semibold transition-colors ${
                      pathname === item.href
                        ? "bg-gray-100 text-gray-900"
                        : "text-gray-900 hover:bg-gray-50"
                    }`}
                  >
                    {item.label}
                  </Link>
              ))}
            </nav>
          </div>
        </div>
      )}

      {children}
      {!isHomePage && <Footer />}
      <CookieConsent />
    </div>
  );
}
