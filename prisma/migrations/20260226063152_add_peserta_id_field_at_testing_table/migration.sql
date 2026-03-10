/*
  Warnings:

  - Added the required column `pesertaId` to the `Testing` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Testing" ADD COLUMN     "pesertaId" INTEGER NOT NULL;
