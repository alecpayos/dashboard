'use server'

import { BsGithub } from "react-icons/bs"

export const GithubSignin = ({ providerUrl }: { providerUrl: string }) => {
  return (
    <form action={providerUrl}>
      <button type="submit"><BsGithub className="w-[40px] h-[40px]" /></button>
    </form>
  )
}