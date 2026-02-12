/*
  Warnings:

  - You are about to drop the `CfitOption` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CfitQuestion` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "CfitOption" DROP CONSTRAINT "CfitOption_questionId_fkey";

-- DropTable
DROP TABLE "CfitOption";

-- DropTable
DROP TABLE "CfitQuestion";
