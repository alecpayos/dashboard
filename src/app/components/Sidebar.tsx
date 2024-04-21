'use client'

import { Accordion, AccordionItem } from "@nextui-org/react"
import Link from "next/link"
import { ReactElement, ReactNode, useState } from "react"
import { IconType } from "react-icons"
import { BsHouseDoor, BsUpcScan } from "react-icons/bs"
import { FaRegUser } from "react-icons/fa"
import { HiOutlineBuildingOffice2 } from "react-icons/hi2"
import { IoArrowUndoOutline } from "react-icons/io5"
import { LiaToolsSolid } from "react-icons/lia"
import { LuFolderSync } from "react-icons/lu"
import { MdOutlineRotate90DegreesCw } from "react-icons/md"
import { RiQrScan2Line } from "react-icons/ri"
import { SlDocs } from "react-icons/sl"
import { TbReport } from "react-icons/tb"

type SubItem = {
  item: string, route: string
}

type SidebarItems = {
  [key: string]: {
    icon: ReactElement,
    subItems: SubItem[]
  }
}

const sidebarItems: SidebarItems = {
  "Home": { icon: <BsHouseDoor />, subItems: [

  ]},
  "Tools": { icon: <LiaToolsSolid />, subItems: [
    { item: "Dismissed Scans", route: "" },
    { item: "Sync Password", route: "" },
    { item: "Send Email", route: "" },
  ]},
  "Radiology": { icon: <RiQrScan2Line />, subItems: [
    { item: "Radiologist List", route: "" },
    { item: "Radiologist Stats", route: "" },
    { item: "Radiologist Reports", route: "" },
    { item: "Auto Assign", route: "" },
    { item: "Radiologists By State", route: "" },
    { item: "Expiring Licenses", route: "" },
  ]},
  "Customers": { icon: <HiOutlineBuildingOffice2 />, subItems: [
    { item: "DSO", route: "" },
    { item: "DSO (BETA)", route: "" },
    { item: "Offices", route: "" },
    { item: "New Offices", route: "" },
    { item: "Itemized Bills", route: "" }
  ]},
  "Users": { icon: <FaRegUser />, subItems: [
    { item: "User List", route: "" },
    { item: "Set User Password", route: "" }
  ]},
  "Scans": { icon: <BsUpcScan />, subItems: [
    { item: "List", route: "" },
    { item: "Stats", route: "" },
    { item: "Stats (Monthly)", route: "" },
    { item: "By State", route: "" }
  ]},
  "Scan Processing": { icon: <MdOutlineRotate90DegreesCw />, subItems: [
    { item: "New Scans", route: "" },
    { item: "Report Images", route: "" },
    { item: "Assign Radiologist", route: "" }
  ]},
  "Reports": { icon: <TbReport />, subItems: [
    { item: "Stats", route: "" },
    { item: "Stats (Monthly)", route: "" },
    { item: "Pending", route: "" },
    { item: "Completed", route: "" }
  ]},
  "DentalRay Sync": { icon: <LuFolderSync />, subItems: [
    { item: "Sync Status", route: "" },
    { item: "Sync UI", route: "" }
  ]},
  "API Documentation": { icon: <SlDocs />, subItems: [
    { item: "Admin Dash", route: "" },
    { item: "Customer Dash", route: "" },
    { item: "Radiologist Dash", route: "" },
    { item: "DentalRay Sync", route: "" }
  ]},
}

const Sidebar = () => {
  const [collapsed, setCollapse] = useState(false)
  const hidden = collapsed ? 'hidden' : ''
  const sidebarWidth = collapsed ? 'w-[68px]' : 'w-[240px]'
  const collapserPosition = collapsed ? 'self-center' : 'self-end'
  const collapserMargin = collapsed ? 'me-0' : 'me-2'

  const accordionItems = Object.keys(sidebarItems)
  const handleItemClick = () => {
    
  }

  const collapseSidebar = () => {
    setCollapse(!collapsed)
  }

  return (
    <aside className={`sidebar ${sidebarWidth}`}>
      <IoArrowUndoOutline onClick={collapseSidebar} className={`collapse-sidebar ${collapserPosition} ${collapserMargin}`} />

      <Accordion showDivider={false} fullWidth={false} className="w-full flex flex-col" itemClasses={{
        base: 'flex flex-col hover:bg-sky-50 rounded-2xl px-4 w-full',
        titleWrapper: hidden,
        title: `text-sm w-max text-zinc-500 ${hidden}`,
        startContent: 'text-[20px]'
      }}>
        {accordionItems.map((item, index) => {
          return (
            <AccordionItem
              key={index}
              aria-label={item}
              title={item}
              startContent={sidebarItems[item].icon}
              hideIndicator={true}
              onClickCapture={handleItemClick}
            >
              <div className="flex flex-col mb-2">
                {sidebarItems[item].subItems.map((subItem, index) => {
                  return <Link key={index} href={subItem.route}>
                    <p className="accordion-sub-item">{subItem.item}</p>
                  </Link>
                })}
              </div>
            </AccordionItem>
          )
        })}
      </Accordion>
    </aside>
  )
}

export default Sidebar