import { NextResponse } from "next/server";
import prisma from "@/lib/prisma";

const LOGISTICS_CONTACT_EMAIL_KEY = "logisticsContactEmail";
const LOGISTICS_CONTACT_PHONE_KEY = "logisticsContactPhone";

// GET - Site ayarlarını getir (public)
export async function GET() {
  try {
    let settings = await prisma.generalSettings.findFirst({
      where: { isActive: true },
    });

    if (!settings) {
      // Default değerlerle oluştur
      settings = await prisma.generalSettings.create({
        data: {
          siteName: "Alamira Rice",
          siteTagline: "Pure Rice, Pure Life",
          siteDescription: "Premium quality Basmati and Sella rice products",
          email: "info@alamira.com",
          phone: "(000) 000-0000",
          address: "123 Rice Street, Agriculture City",
          facebook: "https://facebook.com/alamira",
          instagram: "https://instagram.com/alamira",
          twitter: "https://twitter.com/alamira",
          metaTitle: "Alamira Rice | Premium Basmati & Sella Rice",
          metaDescription: "Pure Rice, Pure Life - Premium quality Basmati and Sella rice products grown with care.",
          metaKeywords: "rice, basmati, sella, organic, premium, alamira",
          footerText: "Alamira Rice brings you the finest quality rice, grown with integrity and love.",
          copyrightText: "© 2026 Alamira Rice. All rights reserved.",
          isActive: true,
        },
      });
    }

    const extra = await prisma.siteSettings.findMany({
      where: { key: { in: [LOGISTICS_CONTACT_EMAIL_KEY, LOGISTICS_CONTACT_PHONE_KEY] } },
    });
    const extrasByKey = Object.fromEntries(extra.map((s) => [s.key, s.value]));

    return NextResponse.json({
      ...settings,
      logisticsContactEmail: extrasByKey[LOGISTICS_CONTACT_EMAIL_KEY] ?? null,
      logisticsContactPhone: extrasByKey[LOGISTICS_CONTACT_PHONE_KEY] ?? null,
    });
  } catch (error) {
    console.error("Settings fetch error:", error);
    return NextResponse.json(
      { error: "Ayarlar yüklenemedi" },
      { status: 500 }
    );
  }
}
