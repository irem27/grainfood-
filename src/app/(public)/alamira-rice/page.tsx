"use client";
import HeroSection from "@/components/public/HeroSection";
import AboutSection from "@/components/public/AboutSection";
import ProductsSection from "@/components/public/ProductsSection";
import { useEffect, useState } from "react";
import InstagramSection from "@/components/public/InstagramSection";
import BlogSection from "@/components/public/BlogSection";


export default function AlamiraRicePage() {
  const [hasProducts, setHasProducts] = useState<boolean | null>(null);

  useEffect(() => {
    fetch("/api/admin/products")
      .then((res) => res.json())
      .then((data) => {
        setHasProducts(Array.isArray(data.latestProducts) && data.latestProducts.length > 0);
      })
      .catch(() => setHasProducts(false));
  }, []);

  return (
    <main>
      <HeroSection />
      <AboutSection siteKey="alamira" />
      {hasProducts && <ProductsSection />}
      {/* <InstagramSection /> */}
      <BlogSection />
    </main>
  );
}
