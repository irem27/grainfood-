import { NextRequest, NextResponse } from "next/server";

export default async function middleware(req: NextRequest) {
  // Auth protection is handled by dashboard/layout.tsx via auth()
  // Middleware only exists for matcher config
  return NextResponse.next();
}

export const config = {
  matcher: ["/((?!_next/static|_next/image|favicon.ico|images|uploads|api).*)"],
};
