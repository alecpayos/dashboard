/*
  Warnings:

  - You are about to drop the column `officeId` on the `users` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "users" DROP CONSTRAINT "users_officeId_fkey";

-- AlterTable
ALTER TABLE "users" DROP COLUMN "officeId";

-- CreateTable
CREATE TABLE "_OfficeToUser" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "_OfficeToUser_AB_unique" ON "_OfficeToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_OfficeToUser_B_index" ON "_OfficeToUser"("B");

-- AddForeignKey
ALTER TABLE "_OfficeToUser" ADD CONSTRAINT "_OfficeToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "offices"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_OfficeToUser" ADD CONSTRAINT "_OfficeToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
