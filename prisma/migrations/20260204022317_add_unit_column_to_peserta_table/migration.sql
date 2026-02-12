-- CreateEnum
CREATE TYPE "Unit" AS ENUM ('SMP', 'MPP', 'MMPP', 'IMP', 'PPH', 'ACS', 'UNKNOWN');

-- AlterTable
ALTER TABLE "Peserta" ADD COLUMN     "unit" "Unit" NOT NULL DEFAULT 'UNKNOWN';
