'use server'

import { redirect } from "next/navigation"

export const handleForceLogin = (formData: FormData) => {
  const email = formData.get('email')
  const password = formData.get('password')
  
  if (!email && !password) redirect('/dashboard')
}