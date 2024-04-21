/*
  Warnings:

  - You are about to drop the column `name` on the `users` table. All the data in the column will be lost.
  - You are about to drop the `Post` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `birthdate` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `country_code` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `first_name` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `last_name` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `password` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `phone_number` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `type` to the `users` table without a default value. This is not possible if the table is not empty.
  - Added the required column `username` to the `users` table without a default value. This is not possible if the table is not empty.
  - Made the column `email` on table `users` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "Post" DROP CONSTRAINT "Post_authorId_fkey";

-- AlterTable
ALTER TABLE "users" DROP COLUMN "name",
ADD COLUMN     "birthdate" TIMESTAMP(3) NOT NULL,
ADD COLUMN     "country_code" INTEGER NOT NULL,
ADD COLUMN     "first_name" TEXT NOT NULL,
ADD COLUMN     "last_name" TEXT NOT NULL,
ADD COLUMN     "officeId" TEXT,
ADD COLUMN     "password" TEXT NOT NULL,
ADD COLUMN     "phone_number" BIGINT NOT NULL,
ADD COLUMN     "type" TEXT NOT NULL,
ADD COLUMN     "username" TEXT NOT NULL,
ALTER COLUMN "email" SET NOT NULL,
ALTER COLUMN "updated_at" SET DEFAULT CURRENT_TIMESTAMP;

-- DropTable
DROP TABLE "Post";

-- CreateTable
CREATE TABLE "offices" (
    "id" TEXT NOT NULL,
    "active" SMALLINT NOT NULL,
    "onboarding_status" BOOLEAN NOT NULL DEFAULT false,
    "name" TEXT NOT NULL,
    "address_line_one" TEXT NOT NULL,
    "address_line_two" TEXT,
    "city" TEXT NOT NULL,
    "state" TEXT NOT NULL,
    "zipcode" INTEGER NOT NULL,
    "phone_number" BIGINT NOT NULL,
    "primary_contact_id" TEXT,
    "technical_contact_id" TEXT,
    "notes" TEXT NOT NULL,
    "md_price_per_scan" SMALLINT NOT NULL,
    "omr_price_per_scan" SMALLINT NOT NULL,
    "report_credits" SMALLINT NOT NULL,
    "cancelled_at" TIMESTAMP(3),
    "cancel_reason" TEXT,
    "acquisition_style" SMALLINT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "offices_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "office_sync_settings" (
    "id" TEXT NOT NULL,
    "sync_version" TEXT,
    "watch_directory" TEXT,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "officeId" TEXT NOT NULL,

    CONSTRAINT "office_sync_settings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "office_machines" (
    "id" TEXT NOT NULL,
    "managemend_software" TEXT,
    "cbct_model" TEXT,
    "viewing_software" TEXT,
    "hostname" TEXT,
    "mac_address" TEXT,
    "remote_access" TEXT,
    "last_access" TIMESTAMP(3),
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "officeId" TEXT NOT NULL,

    CONSTRAINT "office_machines_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "office_smart_dismiss_settings" (
    "id" TEXT NOT NULL,
    "modalities" TEXT NOT NULL,
    "office_calibration" BOOLEAN NOT NULL DEFAULT false,
    "blurry_scans" BOOLEAN NOT NULL DEFAULT false,
    "company_calibration" BOOLEAN NOT NULL DEFAULT false,
    "age_restrictions" SMALLINT NOT NULL,
    "post_op" SMALLINT NOT NULL,
    "fov_restrictions" SMALLINT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "officeId" TEXT NOT NULL,

    CONSTRAINT "office_smart_dismiss_settings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "medias" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "medias_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "scans" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "scans_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "reports" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "reports_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "itemized_bills" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "itemized_bills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "documentation" (
    "id" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "documentation_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "office_sync_settings_officeId_key" ON "office_sync_settings"("officeId");

-- CreateIndex
CREATE UNIQUE INDEX "office_machines_officeId_key" ON "office_machines"("officeId");

-- CreateIndex
CREATE UNIQUE INDEX "office_smart_dismiss_settings_officeId_key" ON "office_smart_dismiss_settings"("officeId");

-- AddForeignKey
ALTER TABLE "users" ADD CONSTRAINT "users_officeId_fkey" FOREIGN KEY ("officeId") REFERENCES "offices"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "office_sync_settings" ADD CONSTRAINT "office_sync_settings_officeId_fkey" FOREIGN KEY ("officeId") REFERENCES "offices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "office_machines" ADD CONSTRAINT "office_machines_officeId_fkey" FOREIGN KEY ("officeId") REFERENCES "offices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "office_smart_dismiss_settings" ADD CONSTRAINT "office_smart_dismiss_settings_officeId_fkey" FOREIGN KEY ("officeId") REFERENCES "offices"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
