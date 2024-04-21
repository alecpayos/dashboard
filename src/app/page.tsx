import { Metadata } from 'next'
import { HiOutlineLockClosed, HiOutlineUser } from "react-icons/hi"
import { BsFacebook, BsGithub } from "react-icons/bs"
import { FcGoogle } from "react-icons/fc"
import { handleForceLogin } from "@/api/actions"
 
export const metadata: Metadata = {
  title: 'Login | Sample Dashboard',
  description: 'Login page of sample dashboard cloned from previous work',
}

export default function Home() {
  return (
    <form className="login-form" action={handleForceLogin}>
      <section className="login-form-content">
        <h3 className="text-2xl font-bold self-center">Sample Dashboard</h3>

        <div className="flex flex-col mt-12">
          <label htmlFor="email" className="text-xs text-gray-500 font-semibold">Email</label>
          <div className="flex relative">
            <HiOutlineUser className="text-gray-400 absolute text-lg top-[12px] left-2" />
            <input className="login-input" type="email" name="email" placeholder="Type your email" />
          </div>
        </div>

        <div className="flex flex-col mt-8">
          <label htmlFor="password" className="text-xs text-gray-500 font-semibold">Password</label>
          <div className="flex relative">
            <HiOutlineLockClosed className="text-gray-400 absolute text-lg top-[12px] left-2" />
            <input className="login-input" type="password" name="password" placeholder="Type your password" />
          </div>
        </div>

        <button type="button" className="text-xs mt-3 self-end hover:underline">Forgot password?</button>
        
        <button type="submit" className="login-button">LOGIN</button>

        <p className="mt-16 self-center text-xs">Or Sign In Using</p>
        <div className="self-center flex mt-4 items-center">
          <button type="button"><BsFacebook className="w-[40px] h-[40px] text-blue-500" /></button>
          <button type="button"><FcGoogle className="w-[48px] h-[48px] mx-4" /></button>
          <button type="button"><BsGithub className="w-[40px] h-[40px]" /></button>
        </div>

        <p className="mt-12 self-center text-xs">Don"t have an account yet?</p>
        <button type="button" className="text-sm mt-3 py-2 px-4 w-1/2 self-center rounded-full hover:bg-gray-200">SIGN UP</button>

      </section>
    </form>
  )
}