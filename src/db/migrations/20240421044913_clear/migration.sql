/*
  Warnings:

  - You are about to drop the column `cancel_reason` on the `offices` table. All the data in the column will be lost.
  - You are about to drop the column `primary_contact_id` on the `offices` table. All the data in the column will be lost.
  - You are about to drop the column `technical_contact_id` on the `offices` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "offices" DROP COLUMN "cancel_reason",
DROP COLUMN "primary_contact_id",
DROP COLUMN "technical_contact_id",
ADD COLUMN     "status_change_reason" TEXT;
