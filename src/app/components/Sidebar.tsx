'use client'

import Link from "next/link"
import { BsHouseDoor, BsUpcScan } from "react-icons/bs"
import { FaRegUser } from "react-icons/fa"
import { HiOutlineBuildingOffice2 } from "react-icons/hi2"
import { LiaToolsSolid } from "react-icons/lia"
import { LuFolderSync } from "react-icons/lu"
import { MdOutlineRotate90DegreesCw } from "react-icons/md"
import { RiQrScan2Line } from "react-icons/ri"
import { SlDocs } from "react-icons/sl"
import { TbReport } from "react-icons/tb"

const sidebarLinkItems = [
  { name: "Dashboard", link: '/dashboard', icon: <BsHouseDoor /> },
  { name: "Tools", link: '/tools', icon: <LiaToolsSolid /> },
  { name: "Radiology", link: '/radiology', icon: <RiQrScan2Line /> },
  { name: "Customers", link: '/customers', icon: <HiOutlineBuildingOffice2 /> },
  { name: "Users", link: '/users', icon: <FaRegUser /> },
  { name: "Scans", link: '/scans', icon: <BsUpcScan /> },
  { name: "Scan Processing", link: '/scan-processing', icon: <MdOutlineRotate90DegreesCw /> },
  { name: "Reports", link: '/reports', icon: <TbReport /> },
  { name: "DentalRay Sync", link: '/dentalray-sync', icon: <LuFolderSync /> },
  { name: "API Documentation", link: '/api-documentation', icon: <SlDocs /> },
]

const Sidebar = () => {
  return (
    <aside className="sidebar w-max shadow-small">
      <div className="w-full flex flex-col">
        {sidebarLinkItems.map(({ name, link, icon }, index) => {
          return (
            <Link 
              key={index}
              href={link}
              className="sidebar-item"
            >
              <span className="text-[20px] me-4">
                {icon}
              </span>
              {name}
            </Link>
          )
        })}
      </div>
    </aside>
  )
}

export default Sidebar