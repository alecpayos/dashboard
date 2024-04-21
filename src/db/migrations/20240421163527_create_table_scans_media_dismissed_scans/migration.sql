/*
  Warnings:

  - You are about to drop the column `created_at` on the `documentation` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `documentation` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `medias` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `medias` table. All the data in the column will be lost.
  - You are about to drop the column `acquisition_style` on the `offices` table. All the data in the column will be lost.
  - You are about to drop the column `active` on the `offices` table. All the data in the column will be lost.
  - You are about to drop the column `address_line_one` on the `offices` table. All the data in the column will be lost.
  - You are about to drop the column `address_line_two` on the `offices` table. All the data in the column will be lost.
  - You are about to drop the column `cancelled_at` on the `offices` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `offices` table. All the data in the column will be lost.
  - You are about to drop the column `md_price_per_scan` on the `offices` table. All the data in the column will be lost.
  - You are about to drop the column `omr_price_per_scan` on the `offices` table. All the data in the column will be lost.
  - You are about to drop the column `onboarding_status` on the `offices` table. All the data in the column will be lost.
  - You are about to drop the column `phone_number` on the `offices` table. All the data in the column will be lost.
  - You are about to drop the column `report_credits` on the `offices` table. All the data in the column will be lost.
  - You are about to drop the column `status_change_reason` on the `offices` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `offices` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `reports` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `reports` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `scans` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `scans` table. All the data in the column will be lost.
  - You are about to drop the column `birthdate` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `country_code` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `created_at` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `first_name` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `last_name` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `phone_number` on the `users` table. All the data in the column will be lost.
  - You are about to drop the column `updated_at` on the `users` table. All the data in the column will be lost.
  - You are about to drop the `itemized_bills` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `office_machines` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `office_smart_dismiss_settings` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `office_sync_settings` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[userId]` on the table `medias` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[scanId]` on the table `medias` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[officeId]` on the table `scans` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[dismissId]` on the table `scans` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `meta` to the `medias` table without a default value. This is not possible if the table is not empty.
  - Added the required column `path` to the `medias` table without a default value. This is not possible if the table is not empty.
  - Added the required column `scanId` to the `medias` table without a default value. This is not possible if the table is not empty.
  - Added the required column `userId` to the `medias` table without a default value. This is not possible if the table is not empty.
  - Added the required column `activeState` to the `offices` table without a default value. This is not possible if the table is not empty.
  - Added the required column `addressOne` to the `offices` table without a default value. This is not possible if the table is not empty.
  - Added the required column `mdPricePerScan` to the `offices` table without a default value. This is not possible if the table is not empty.
  - Added the required column `omrPricePerScan` to the `offices` table without a default value. This is not possible if the table is not empty.
  - Added the required column `phoneNumber` to the `offices` table without a default value. This is not possible if the table is not empty.
  - Added the required column `reportCredits` to the `offices` table without a default value. This is not possible if the table is not empty.
  - Added the required column `scanAcquisitionStyle` to the `offices` table without a default value. This is not possible if the table is not empty.
  - Added the required column `officeId` to the `scans` table without a default value. This is not possible if the table is not empty.
  - Added the required column `birthDate` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `countryCode` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `firstName` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `lastName` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `phoneNumber` to the `users` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "office_machines" DROP CONSTRAINT "office_machines_officeId_fkey";

-- DropForeignKey
ALTER TABLE "office_smart_dismiss_settings" DROP CONSTRAINT "office_smart_dismiss_settings_officeId_fkey";

-- DropForeignKey
ALTER TABLE "office_sync_settings" DROP CONSTRAINT "office_sync_settings_officeId_fkey";

-- AlterTable
ALTER TABLE "documentation" DROP COLUMN "created_at",
DROP COLUMN "updated_at",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "medias" DROP COLUMN "created_at",
DROP COLUMN "updated_at",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "meta" TEXT NOT NULL,
ADD COLUMN     "path" TEXT NOT NULL,
ADD COLUMN     "scanId" TEXT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "userId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "offices" DROP COLUMN "acquisition_style",
DROP COLUMN "active",
DROP COLUMN "address_line_one",
DROP COLUMN "address_line_two",
DROP COLUMN "cancelled_at",
DROP COLUMN "created_at",
DROP COLUMN "md_price_per_scan",
DROP COLUMN "omr_price_per_scan",
DROP COLUMN "onboarding_status",
DROP COLUMN "phone_number",
DROP COLUMN "report_credits",
DROP COLUMN "status_change_reason",
DROP COLUMN "updated_at",
ADD COLUMN     "activeState" SMALLINT NOT NULL,
ADD COLUMN     "addressOne" TEXT NOT NULL,
ADD COLUMN     "addressTwo" TEXT,
ADD COLUMN     "cancelledAt" TIMESTAMP(3),
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "mdPricePerScan" SMALLINT NOT NULL,
ADD COLUMN     "omrPricePerScan" SMALLINT NOT NULL,
ADD COLUMN     "onboardStatus" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "phoneNumber" BIGINT NOT NULL,
ADD COLUMN     "reportCredits" SMALLINT NOT NULL,
ADD COLUMN     "scanAcquisitionStyle" SMALLINT NOT NULL,
ADD COLUMN     "statusChangeReason" TEXT,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "reports" DROP COLUMN "created_at",
DROP COLUMN "updated_at",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- AlterTable
ALTER TABLE "scans" DROP COLUMN "created_at",
DROP COLUMN "updated_at",
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "dismissId" TEXT,
ADD COLUMN     "isInHouse" BOOLEAN DEFAULT false,
ADD COLUMN     "isOmrReportRequested" BOOLEAN,
ADD COLUMN     "notes" TEXT,
ADD COLUMN     "officeId" TEXT NOT NULL,
ADD COLUMN     "omrAssignedAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "radiologistAssignedAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "radiologyReportType" TEXT,
ADD COLUMN     "reportImages" TEXT,
ADD COLUMN     "scanSource" TEXT,
ADD COLUMN     "skippedUntil" TIMESTAMP(3),
ADD COLUMN     "status" TEXT,
ADD COLUMN     "studyType" TEXT,
ADD COLUMN     "timezone" TEXT,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "viewerLink" TEXT,
ADD COLUMN     "viewerPlatform" TEXT;

-- AlterTable
ALTER TABLE "users" DROP COLUMN "birthdate",
DROP COLUMN "country_code",
DROP COLUMN "created_at",
DROP COLUMN "first_name",
DROP COLUMN "last_name",
DROP COLUMN "phone_number",
DROP COLUMN "updated_at",
ADD COLUMN     "birthDate" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "countryCode" INTEGER NOT NULL,
ADD COLUMN     "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "firstName" TEXT NOT NULL,
ADD COLUMN     "lastName" TEXT NOT NULL,
ADD COLUMN     "phoneNumber" BIGINT NOT NULL,
ADD COLUMN     "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP;

-- DropTable
DROP TABLE "itemized_bills";

-- DropTable
DROP TABLE "office_machines";

-- DropTable
DROP TABLE "office_smart_dismiss_settings";

-- DropTable
DROP TABLE "office_sync_settings";

-- CreateTable
CREATE TABLE "officeSyncSettings" (
    "id" TEXT NOT NULL,
    "officeId" TEXT NOT NULL,
    "syncVersion" TEXT,
    "syncWatchDirectory" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "officeSyncSettings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "officeMachines" (
    "id" TEXT NOT NULL,
    "officeId" TEXT NOT NULL,
    "managementSoftware" TEXT,
    "cbctModel" TEXT,
    "viewingSoftware" TEXT,
    "desktopHostname" TEXT,
    "desktopMacAddress" TEXT,
    "desktopRemoteAccess" TEXT,
    "desktopLastAccessed" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "officeMachines_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "officeSmartDismissSettings" (
    "id" TEXT NOT NULL,
    "officeId" TEXT NOT NULL,
    "modalities" TEXT NOT NULL,
    "officeCalibration" BOOLEAN NOT NULL DEFAULT false,
    "blurryScans" BOOLEAN NOT NULL DEFAULT false,
    "companyCalibration" BOOLEAN NOT NULL DEFAULT false,
    "ageRestrictions" SMALLINT NOT NULL,
    "postOp" SMALLINT NOT NULL,
    "fovRestrictions" SMALLINT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "officeSmartDismissSettings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ScanDismissStatus" (
    "id" TEXT NOT NULL,
    "dismissBy" TEXT NOT NULL,
    "dismissReason" TEXT,
    "dismissAt" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "ScanDismissStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "itemizedBills" (
    "id" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "itemizedBills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ScanToUser" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "officeSyncSettings_officeId_key" ON "officeSyncSettings"("officeId");

-- CreateIndex
CREATE UNIQUE INDEX "officeMachines_officeId_key" ON "officeMachines"("officeId");

-- CreateIndex
CREATE UNIQUE INDEX "officeSmartDismissSettings_officeId_key" ON "officeSmartDismissSettings"("officeId");

-- CreateIndex
CREATE UNIQUE INDEX "ScanDismissStatus_dismissBy_key" ON "ScanDismissStatus"("dismissBy");

-- CreateIndex
CREATE UNIQUE INDEX "_ScanToUser_AB_unique" ON "_ScanToUser"("A", "B");

-- CreateIndex
CREATE INDEX "_ScanToUser_B_index" ON "_ScanToUser"("B");

-- CreateIndex
CREATE UNIQUE INDEX "medias_userId_key" ON "medias"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "medias_scanId_key" ON "medias"("scanId");

-- CreateIndex
CREATE UNIQUE INDEX "scans_officeId_key" ON "scans"("officeId");

-- CreateIndex
CREATE UNIQUE INDEX "scans_dismissId_key" ON "scans"("dismissId");

-- AddForeignKey
ALTER TABLE "officeSyncSettings" ADD CONSTRAINT "officeSyncSettings_officeId_fkey" FOREIGN KEY ("officeId") REFERENCES "offices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "officeMachines" ADD CONSTRAINT "officeMachines_officeId_fkey" FOREIGN KEY ("officeId") REFERENCES "offices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "officeSmartDismissSettings" ADD CONSTRAINT "officeSmartDismissSettings_officeId_fkey" FOREIGN KEY ("officeId") REFERENCES "offices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "medias" ADD CONSTRAINT "medias_userId_fkey" FOREIGN KEY ("userId") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "medias" ADD CONSTRAINT "medias_scanId_fkey" FOREIGN KEY ("scanId") REFERENCES "scans"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "scans" ADD CONSTRAINT "scans_officeId_fkey" FOREIGN KEY ("officeId") REFERENCES "offices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "scans" ADD CONSTRAINT "scans_dismissId_fkey" FOREIGN KEY ("dismissId") REFERENCES "ScanDismissStatus"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ScanDismissStatus" ADD CONSTRAINT "ScanDismissStatus_dismissBy_fkey" FOREIGN KEY ("dismissBy") REFERENCES "users"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ScanToUser" ADD CONSTRAINT "_ScanToUser_A_fkey" FOREIGN KEY ("A") REFERENCES "scans"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ScanToUser" ADD CONSTRAINT "_ScanToUser_B_fkey" FOREIGN KEY ("B") REFERENCES "users"("id") ON DELETE CASCADE ON UPDATE CASCADE;
