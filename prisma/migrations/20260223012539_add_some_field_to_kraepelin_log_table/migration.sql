/*
  Warnings:

  - You are about to drop the column `completedAt` on the `KraepelinLog` table. All the data in the column will be lost.
  - You are about to drop the column `logs` on the `KraepelinLog` table. All the data in the column will be lost.
  - Added the required column `event` to the `KraepelinLog` table without a default value. This is not possible if the table is not empty.
  - Added the required column `fromCol` to the `KraepelinLog` table without a default value. This is not possible if the table is not empty.
  - Added the required column `fromPair` to the `KraepelinLog` table without a default value. This is not possible if the table is not empty.
  - Added the required column `toCol` to the `KraepelinLog` table without a default value. This is not possible if the table is not empty.
  - Added the required column `toPair` to the `KraepelinLog` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "KraepelinLog" DROP COLUMN "completedAt",
DROP COLUMN "logs",
ADD COLUMN     "event" TEXT NOT NULL,
ADD COLUMN     "fromCol" INTEGER NOT NULL,
ADD COLUMN     "fromPair" INTEGER NOT NULL,
ADD COLUMN     "toCol" INTEGER NOT NULL,
ADD COLUMN     "toPair" INTEGER NOT NULL;
