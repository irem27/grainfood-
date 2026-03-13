import { getToken } from "next-auth/jwt";
import { NextRequest, NextResponse } from "next/server";

export default async function middleware(req: NextRequest) {
  const token = await getToken({ req, secret: process.env.NEXTAUTH_SECRET });
  const isLoggedIn = !!token;
  const isOnDashboard = req.nextUrl.pathname.startsWith("/dashboard");
  const isOnLogin = req.nextUrl.pathname === "/login";
  const isOnApi = req.nextUrl.pathname.startsWith("/api");

  // API rotaları için auth kontrolü (admin API'leri hariç seed)
  if (isOnApi) {
    return NextResponse.next();
  }

  // Dashboard'a giriş yapmadan erişim
  if (isOnDashboard && !isLoggedIn) {
    return NextResponse.redirect(new URL("/login", req.url));
  }

  // Zaten giriş yapmış kullanıcı login sayfasına giderse
  if (isOnLogin && isLoggedIn) {
    return NextResponse.redirect(new URL("/dashboard", req.url));
  }
  return NextResponse.next();
}

export const config = {
  matcher: ["/((?!_next/static|_next/image|favicon.ico|images|uploads).*)"],
};
