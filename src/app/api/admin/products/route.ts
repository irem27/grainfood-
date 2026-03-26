export const dynamic = "force-dynamic";
export const runtime = "nodejs";

import { NextResponse } from "next/server";
import prisma from "@/lib/prisma";

// GET - Products Section settings, categories and products
export async function GET() {
  try {
    // Get section settings
    let section = await prisma.productsSection.findFirst({
      where: { isActive: true },
    });

    if (!section) {
      section = await prisma.productsSection.create({
        data: {
          badgeText: "Alamira Products",
          title: "Pure Products And Honest Practices",
          description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed Lorem ipsum dolor sit amet, consectetur adipiscing elit,",
          buttonText: "View All Product",
          buttonLink: "/products",
          isActive: true,
        },
      });
    }

    // Get categories with products
    const categories = await prisma.productCategory.findMany({
      where: { isActive: true },
      orderBy: { order: "asc" },
      include: {
        products: {
          where: { isActive: true },
          orderBy: { order: "asc" },
        },
      },
    });

    // Get latest 10 products
    const latestProducts = await prisma.product.findMany({
      where: { isActive: true },
      orderBy: { createdAt: "desc" },
      take: 10,
      include: {
        category: true,
      },
    });

    return NextResponse.json({ section, categories, latestProducts });
  } catch (error) {
    console.error("Error fetching products:", error);
    return NextResponse.json(
      { error: "Failed to fetch products" },
      { status: 500 }
    );
  }
}

// PUT - Update section settings
export async function PUT(request: Request) {
  try {
    const body = await request.json();
    const { id, badgeText, title, description, buttonText, buttonLink } = body;

    if (!id) {
      return NextResponse.json({ error: "ID is required" }, { status: 400 });
    }

    const section = await prisma.productsSection.update({
      where: { id },
      data: {
        badgeText,
        title,
        description,
        buttonText,
        buttonLink,
        updatedAt: new Date(),
      },
    });

    return NextResponse.json(section);
  } catch (error) {
    console.error("Error updating products section:", error);
    return NextResponse.json(
      { error: "Failed to update products section" },
      { status: 500 }
    );
  }
}
