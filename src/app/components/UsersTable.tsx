'use client'

import {Table, TableHeader, TableColumn, TableBody, TableRow, TableCell} from "@nextui-org/react"

export default function UsersTable() {
  return (
    <Table aria-label="Users table, empty until populated with data." className="w-full">
      <TableHeader>
        <TableColumn>STATUS</TableColumn>
        <TableColumn>NAME</TableColumn>
        <TableColumn>EMAIL</TableColumn>
        <TableColumn>PHONE NUMBER</TableColumn>
        <TableColumn>LAST LOGIN</TableColumn>
        <TableColumn>CREATED AT</TableColumn>
        <TableColumn>OFFICES</TableColumn>
        <TableColumn>ROLE</TableColumn>
      </TableHeader>
      <TableBody emptyContent={"No rows to display."}>{[]}</TableBody>
    </Table>
  )
}