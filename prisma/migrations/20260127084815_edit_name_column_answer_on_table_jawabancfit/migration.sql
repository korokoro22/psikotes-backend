/*
  Warnings:

  - You are about to drop the column `answer` on the `JawabanCfit` table. All the data in the column will be lost.
  - Added the required column `answers` to the `JawabanCfit` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "JawabanCfit" DROP COLUMN "answer",
ADD COLUMN     "answers" INTEGER NOT NULL;
