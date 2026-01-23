/*
  Warnings:

  - Added the required column `statusTest` to the `TestSession` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "TestSession" ADD COLUMN     "statusTest" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Token" ALTER COLUMN "tests" DROP DEFAULT;
