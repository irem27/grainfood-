-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "public";

-- CreateTable
CREATE TABLE "HeroSection" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "subtitle" TEXT,
    "description" TEXT,
    "buttonText" TEXT,
    "buttonLink" TEXT,
    "backgroundImage" TEXT,
    "heroImage" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "HeroSection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SiteSettings" (
    "id" TEXT NOT NULL,
    "key" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SiteSettings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AboutSection" (
    "id" TEXT NOT NULL,
    "siteKey" TEXT NOT NULL DEFAULT 'alamira',
    "badgeText" TEXT NOT NULL DEFAULT 'About Us',
    "title" TEXT NOT NULL,
    "subtitle" TEXT,
    "description" TEXT,
    "happyUsersCount" TEXT NOT NULL DEFAULT '2000+',
    "happyUsersText" TEXT NOT NULL DEFAULT 'Happy Users Rating',
    "image1" TEXT,
    "image1Alt" TEXT,
    "image2" TEXT,
    "image2Alt" TEXT,
    "infoCardTitle" TEXT,
    "infoCardText" TEXT,
    "badgePercent" TEXT NOT NULL DEFAULT '100%',
    "badgeSubtext" TEXT NOT NULL DEFAULT 'Pure Rice, Pure Life',
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AboutSection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AboutValuesSection" (
    "id" TEXT NOT NULL,
    "siteKey" TEXT NOT NULL DEFAULT 'about',
    "badgeText" TEXT NOT NULL DEFAULT 'Unsere Werte',
    "title" TEXT NOT NULL DEFAULT 'Was uns besonders macht',
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AboutValuesSection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AboutValueItem" (
    "id" TEXT NOT NULL,
    "siteKey" TEXT NOT NULL DEFAULT 'about',
    "title" TEXT NOT NULL,
    "description" TEXT,
    "icon" TEXT NOT NULL DEFAULT 'heart',
    "order" INTEGER NOT NULL DEFAULT 0,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AboutValueItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AboutCtaSection" (
    "id" TEXT NOT NULL,
    "siteKey" TEXT NOT NULL DEFAULT 'about',
    "title" TEXT NOT NULL DEFAULT 'Ready to Experience Pure Rice?',
    "description" TEXT DEFAULT 'Discover our premium collection of Basmati and Sella rice. Taste the difference that quality and care makes.',
    "primaryButtonText" TEXT DEFAULT 'View Our Products',
    "primaryButtonLink" TEXT DEFAULT '/products',
    "secondaryButtonText" TEXT DEFAULT 'Contact Us',
    "secondaryButtonLink" TEXT DEFAULT '/contact',
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AboutCtaSection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProductsSection" (
    "id" TEXT NOT NULL,
    "badgeText" TEXT NOT NULL DEFAULT 'Alamira Products',
    "title" TEXT NOT NULL DEFAULT 'Pure Products And Honest Practices',
    "description" TEXT,
    "buttonText" TEXT NOT NULL DEFAULT 'View All Product',
    "buttonLink" TEXT NOT NULL DEFAULT '/products',
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ProductsSection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProductCategory" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "order" INTEGER NOT NULL DEFAULT 0,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ProductCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Product" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "image" TEXT,
    "price" TEXT,
    "categoryId" TEXT NOT NULL,
    "order" INTEGER NOT NULL DEFAULT 0,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Product_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InstagramSection" (
    "id" TEXT NOT NULL,
    "badgeText" TEXT NOT NULL DEFAULT '@alamira.rice',
    "title" TEXT NOT NULL DEFAULT 'Alamira on Instagram',
    "description" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InstagramSection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InstagramPost" (
    "id" TEXT NOT NULL,
    "image" TEXT NOT NULL,
    "alt" TEXT,
    "link" TEXT,
    "order" INTEGER NOT NULL DEFAULT 0,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "InstagramPost_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BlogSection" (
    "id" TEXT NOT NULL,
    "badgeText" TEXT NOT NULL DEFAULT 'Our Blog',
    "title" TEXT NOT NULL DEFAULT 'Stories Of Rice Crops & Organic',
    "description" TEXT,
    "buttonText" TEXT NOT NULL DEFAULT 'View All Blogs',
    "buttonLink" TEXT NOT NULL DEFAULT '/blog',
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BlogSection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BlogPost" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "excerpt" TEXT,
    "content" TEXT,
    "image" TEXT,
    "author" TEXT NOT NULL DEFAULT 'Admin',
    "date" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "featured" BOOLEAN NOT NULL DEFAULT false,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BlogPost_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "name" TEXT,
    "role" TEXT NOT NULL DEFAULT 'admin',
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ContactSection" (
    "id" TEXT NOT NULL,
    "badgeText" TEXT NOT NULL DEFAULT 'Contact Us',
    "title" TEXT NOT NULL DEFAULT 'Talk To The Team Behind The Grains',
    "description" TEXT,
    "locationTitle" TEXT NOT NULL DEFAULT 'Location',
    "locationText" TEXT NOT NULL DEFAULT 'Lorem ipsum dolor sit amet, consectetuer',
    "emailTitle" TEXT NOT NULL DEFAULT 'Email Us',
    "email1" TEXT NOT NULL DEFAULT 'info@mail.com',
    "email2" TEXT,
    "phoneTitle" TEXT NOT NULL DEFAULT 'Phone',
    "phone1" TEXT NOT NULL DEFAULT '(000)-000-0000',
    "phone2" TEXT,
    "formTitle" TEXT NOT NULL DEFAULT 'Get In Touch With Rice Crops',
    "formDescription" TEXT,
    "contactImage" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ContactSection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ContactSubmission" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT,
    "supportType" TEXT,
    "message" TEXT NOT NULL,
    "isRead" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ContactSubmission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "GeneralSettings" (
    "id" TEXT NOT NULL,
    "siteName" TEXT NOT NULL DEFAULT 'Alamira Rice',
    "siteTagline" TEXT NOT NULL DEFAULT 'Pure Rice, Pure Life',
    "siteDescription" TEXT,
    "logo" TEXT,
    "logoAlamira" TEXT,
    "logoLogistics" TEXT,
    "favicon" TEXT,
    "email" TEXT,
    "phone" TEXT,
    "address" TEXT,
    "facebook" TEXT,
    "instagram" TEXT,
    "twitter" TEXT,
    "youtube" TEXT,
    "linkedin" TEXT,
    "metaTitle" TEXT,
    "metaDescription" TEXT,
    "metaKeywords" TEXT,
    "footerText" TEXT,
    "copyrightText" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "GeneralSettings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FooterConfig" (
    "id" TEXT NOT NULL,
    "siteKey" TEXT NOT NULL,
    "newsletterTitle" TEXT NOT NULL DEFAULT 'Stay Connected With Us',
    "brandName" TEXT NOT NULL DEFAULT 'ALAMIRA',
    "brandDescription" TEXT,
    "accentColor" TEXT NOT NULL DEFAULT '#D4A853',
    "copyrightText" TEXT,
    "topLinks" TEXT NOT NULL DEFAULT '[]',
    "serviceLinks" TEXT NOT NULL DEFAULT '[]',
    "workingHours" TEXT NOT NULL DEFAULT '[]',
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FooterConfig_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NewsletterSubscriber" (
    "id" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "NewsletterSubscriber_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "HeroSlide" (
    "id" TEXT NOT NULL,
    "brand" TEXT NOT NULL DEFAULT 'alamira',
    "title" TEXT NOT NULL,
    "subtitle" TEXT,
    "description" TEXT,
    "image" TEXT,
    "ctaText" TEXT,
    "ctaLink" TEXT,
    "order" INTEGER NOT NULL DEFAULT 0,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "HeroSlide_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ServiceItem" (
    "id" TEXT NOT NULL,
    "number" TEXT NOT NULL DEFAULT '01',
    "title" TEXT NOT NULL,
    "heading" TEXT,
    "subheading" TEXT,
    "description" TEXT,
    "features" TEXT,
    "image" TEXT,
    "icon" TEXT,
    "order" INTEGER NOT NULL DEFAULT 0,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ServiceItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StatsSection" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL DEFAULT 'Let''s See Our Progress',
    "description" TEXT,
    "buttonText" TEXT,
    "buttonLink" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StatsSection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StatItem" (
    "id" TEXT NOT NULL,
    "value" TEXT NOT NULL,
    "label" TEXT NOT NULL,
    "suffix" TEXT,
    "order" INTEGER NOT NULL DEFAULT 0,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "StatItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "QuoteSection" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL DEFAULT 'Get a logistics quote tailored to your shipment',
    "description" TEXT,
    "primaryButtonText" TEXT DEFAULT 'Request a Quote',
    "primaryButtonLink" TEXT DEFAULT '/contact',
    "secondaryButtonText" TEXT DEFAULT 'Contact our team',
    "secondaryButtonLink" TEXT DEFAULT '/contact',
    "image" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "QuoteSection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BrandSection" (
    "id" TEXT NOT NULL,
    "badgeText" TEXT NOT NULL DEFAULT 'Featured Brand',
    "title" TEXT NOT NULL DEFAULT 'ALAMIRA Rice',
    "subtitle" TEXT DEFAULT 'Pure Rice, Pure Life',
    "description" TEXT,
    "buttonText" TEXT DEFAULT 'Visit Alamira Rice',
    "buttonLink" TEXT DEFAULT '/alamira-rice',
    "button2Text" TEXT DEFAULT 'Manage Content',
    "button2Link" TEXT DEFAULT '/dashboard/alamira',
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BrandSection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LogisticsHero" (
    "id" TEXT NOT NULL,
    "badge" TEXT NOT NULL DEFAULT 'Leading Logistics Provider',
    "title" TEXT NOT NULL DEFAULT 'LOGI CRAFT',
    "subtitle" TEXT DEFAULT 'Crafting Your Logistics Success',
    "description" TEXT,
    "backgroundImage" TEXT,
    "searchPlaceholder" TEXT DEFAULT 'Track My Shipment',
    "button1Text" TEXT DEFAULT 'Delivery & coverage',
    "button1Link" TEXT DEFAULT '#services',
    "button2Text" TEXT DEFAULT 'Costs Calculators',
    "button2Link" TEXT DEFAULT '#solutions',
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LogisticsHero_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LogisticsServiceItem" (
    "id" TEXT NOT NULL,
    "number" TEXT NOT NULL DEFAULT '01',
    "label" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "buttonText" TEXT DEFAULT 'More Info',
    "buttonLink" TEXT DEFAULT '#contact',
    "order" INTEGER NOT NULL DEFAULT 0,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LogisticsServiceItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LogisticsStatsSection" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL DEFAULT 'Let''s See Our Progress',
    "description" TEXT,
    "buttonText" TEXT DEFAULT 'More Info',
    "buttonLink" TEXT DEFAULT '#about',
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LogisticsStatsSection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LogisticsStatItem" (
    "id" TEXT NOT NULL,
    "value" INTEGER NOT NULL DEFAULT 0,
    "suffix" TEXT,
    "label" TEXT NOT NULL,
    "order" INTEGER NOT NULL DEFAULT 0,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LogisticsStatItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LogisticsProcessSection" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL DEFAULT 'How We Work',
    "description" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LogisticsProcessSection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LogisticsProcessStep" (
    "id" TEXT NOT NULL,
    "number" TEXT NOT NULL DEFAULT '01',
    "title" TEXT NOT NULL,
    "description" TEXT,
    "image" TEXT,
    "imageAlt" TEXT,
    "icon" TEXT,
    "badgeText" TEXT,
    "colorTheme" TEXT NOT NULL DEFAULT 'blue',
    "isDark" BOOLEAN NOT NULL DEFAULT false,
    "hasImage" BOOLEAN NOT NULL DEFAULT false,
    "order" INTEGER NOT NULL DEFAULT 0,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LogisticsProcessStep_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LogisticsMarqueeWord" (
    "id" TEXT NOT NULL,
    "word" TEXT NOT NULL,
    "order" INTEGER NOT NULL DEFAULT 0,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LogisticsMarqueeWord_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LogisticsNewsSection" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL DEFAULT 'Latest News',
    "description" TEXT,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LogisticsNewsSection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LogisticsNewsArticle" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "slug" TEXT,
    "excerpt" TEXT,
    "content" TEXT,
    "image" TEXT,
    "imageAlt" TEXT,
    "author" TEXT,
    "link" TEXT,
    "publishedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "order" INTEGER NOT NULL DEFAULT 0,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LogisticsNewsArticle_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BrandSlide" (
    "id" TEXT NOT NULL,
    "brand" TEXT NOT NULL DEFAULT 'alamira',
    "title" TEXT NOT NULL,
    "subtitle" TEXT,
    "description" TEXT,
    "buttonText" TEXT,
    "buttonLink" TEXT,
    "backgroundImage" TEXT,
    "theme" TEXT NOT NULL DEFAULT 'dark',
    "accentColor" TEXT NOT NULL DEFAULT 'blue',
    "icon" TEXT NOT NULL DEFAULT 'default',
    "order" INTEGER NOT NULL DEFAULT 0,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BrandSlide_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "SiteSettings_key_key" ON "SiteSettings"("key");

-- CreateIndex
CREATE UNIQUE INDEX "AboutSection_siteKey_key" ON "AboutSection"("siteKey");

-- CreateIndex
CREATE UNIQUE INDEX "AboutValuesSection_siteKey_key" ON "AboutValuesSection"("siteKey");

-- CreateIndex
CREATE INDEX "AboutValueItem_siteKey_idx" ON "AboutValueItem"("siteKey");

-- CreateIndex
CREATE UNIQUE INDEX "AboutCtaSection_siteKey_key" ON "AboutCtaSection"("siteKey");

-- CreateIndex
CREATE UNIQUE INDEX "ProductCategory_slug_key" ON "ProductCategory"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "BlogPost_slug_key" ON "BlogPost"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "FooterConfig_siteKey_key" ON "FooterConfig"("siteKey");

-- CreateIndex
CREATE UNIQUE INDEX "NewsletterSubscriber_email_key" ON "NewsletterSubscriber"("email");

-- CreateIndex
CREATE UNIQUE INDEX "LogisticsNewsArticle_slug_key" ON "LogisticsNewsArticle"("slug");

-- AddForeignKey
ALTER TABLE "Product" ADD CONSTRAINT "Product_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "ProductCategory"("id") ON DELETE CASCADE ON UPDATE CASCADE;

