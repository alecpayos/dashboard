'use server'

import { Users } from "@/app/types";
import { PrismaClient } from "@prisma/client";
import { redirect } from "next/navigation";

const prisma = new PrismaClient();

export const handleForceLogin = (formData: FormData) => {
  const email = formData.get('email')
  const password = formData.get('password')
  
  if (!email && !password) redirect('/dashboard')
}

export const getAllUsers = async (rowsPerPage: number, page: number): Promise<Users> => {
  const data = await prisma.user.findMany({
    take: rowsPerPage,
    skip: (page - 1) * rowsPerPage,
    orderBy: { firstName: 'asc' },
    select: {
      id: true,
      status: true,
      firstName: true,
      lastName: true,
      email: true,
      country: true,
      countryISO: true,
      countryCode: true,
      phoneNumber: true,
      type: true
    }
  });

  const count = await prisma.user.count();

  return {data, count};
}