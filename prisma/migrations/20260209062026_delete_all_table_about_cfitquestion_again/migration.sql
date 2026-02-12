/*
  Warnings:

  - You are about to drop the `CfitOption` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CfitOptionImage` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CfitQuestion` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CfitQuestionImages` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "CfitOption" DROP CONSTRAINT "CfitOption_questionId_fkey";

-- DropForeignKey
ALTER TABLE "CfitOptionImage" DROP CONSTRAINT "CfitOptionImage_optionId_fkey";

-- DropForeignKey
ALTER TABLE "CfitQuestionImages" DROP CONSTRAINT "CfitQuestionImages_questionId_fkey";

-- DropTable
DROP TABLE "CfitOption";

-- DropTable
DROP TABLE "CfitOptionImage";

-- DropTable
DROP TABLE "CfitQuestion";

-- DropTable
DROP TABLE "CfitQuestionImages";
