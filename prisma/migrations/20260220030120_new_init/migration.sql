-- CreateEnum
CREATE TYPE "JenisKelamin" AS ENUM ('LAKI_LAKI', 'PEREMPUAN');

-- CreateEnum
CREATE TYPE "Tests" AS ENUM ('CFIT', 'DISC', 'MSDT', 'MBTI', 'KRAEPELIN', 'PAPIKOSTICK');

-- CreateEnum
CREATE TYPE "Unit" AS ENUM ('SMP', 'MPP', 'MMPP', 'IMP', 'PPH', 'ACS', 'UNKNOWN');

-- CreateTable
CREATE TABLE "Peserta" (
    "id" SERIAL NOT NULL,
    "nama" TEXT NOT NULL,
    "jenisKelamin" "JenisKelamin" NOT NULL,
    "usia" INTEGER NOT NULL,
    "pendidikanTerakhir" TEXT NOT NULL,
    "jurusan" TEXT NOT NULL,
    "tokenId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "unit" "Unit" NOT NULL DEFAULT 'UNKNOWN',
    "email" TEXT NOT NULL DEFAULT 'null',
    "posisi" TEXT NOT NULL DEFAULT 'null',

    CONSTRAINT "Peserta_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TestSession" (
    "id" SERIAL NOT NULL,
    "pesertaId" INTEGER NOT NULL,
    "token" TEXT NOT NULL,
    "startedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "finishedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "statusTest" INTEGER NOT NULL,

    CONSTRAINT "TestSession_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JawabanKraepelin" (
    "id" SERIAL NOT NULL,
    "sessionId" INTEGER NOT NULL,
    "columnIndex" INTEGER NOT NULL,
    "answers" INTEGER[],
    "correctAnswers" INTEGER NOT NULL,
    "wrongAnswers" INTEGER NOT NULL,
    "totalAnswered" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "JawabanKraepelin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "KraepelinLog" (
    "id" SERIAL NOT NULL,
    "sessionId" INTEGER NOT NULL,
    "timestamp" TIMESTAMP(3) NOT NULL,
    "logs" JSONB NOT NULL,
    "completedAt" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "KraepelinLog_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CfitQuestion" (
    "id" SERIAL NOT NULL,
    "subtest" INTEGER NOT NULL,
    "order" INTEGER NOT NULL,
    "imagePath" TEXT NOT NULL,
    "isPractice" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CfitQuestion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CfitOption" (
    "id" SERIAL NOT NULL,
    "questionId" INTEGER NOT NULL,
    "label" TEXT NOT NULL,
    "imagePath" TEXT NOT NULL,

    CONSTRAINT "CfitOption_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MsdtQuestion" (
    "id" SERIAL NOT NULL,
    "sentences" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "MsdtQuestion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DiscQuestion" (
    "id" SERIAL NOT NULL,
    "words" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "DiscQuestion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MbtiQuestion" (
    "id" SERIAL NOT NULL,
    "sentences" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "MbtiQuestion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PapikostickQuestion" (
    "id" SERIAL NOT NULL,
    "sentences" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "PapikostickQuestion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Token" (
    "id" SERIAL NOT NULL,
    "token" TEXT NOT NULL,
    "kuota" INTEGER NOT NULL,
    "usedCount" INTEGER NOT NULL DEFAULT 0,
    "isActive" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "expiredAt" TIMESTAMP(3),
    "tests" "Tests"[],

    CONSTRAINT "Token_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TestAttempt" (
    "id" SERIAL NOT NULL,
    "sessionId" INTEGER NOT NULL,
    "testType" TEXT NOT NULL,
    "startedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "finishedAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TestAttempt_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JawabanPeserta" (
    "id" SERIAL NOT NULL,
    "attemptId" INTEGER NOT NULL,
    "questionId" INTEGER NOT NULL,
    "answer" JSONB NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "JawabanPeserta_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Admin" (
    "id" SERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Admin_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JawabanCfit" (
    "id" SERIAL NOT NULL,
    "sessionId" INTEGER NOT NULL,
    "subtest" INTEGER NOT NULL,
    "questionId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "answers" TEXT[],

    CONSTRAINT "JawabanCfit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JawabanDisc" (
    "id" SERIAL NOT NULL,
    "sessionId" INTEGER NOT NULL,
    "questionId" INTEGER NOT NULL,
    "most" TEXT NOT NULL,
    "least" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "JawabanDisc_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "JawabanKraepelin_sessionId_idx" ON "JawabanKraepelin"("sessionId");

-- CreateIndex
CREATE UNIQUE INDEX "KraepelinLog_sessionId_key" ON "KraepelinLog"("sessionId");

-- CreateIndex
CREATE UNIQUE INDEX "CfitQuestion_subtest_order_isPractice_key" ON "CfitQuestion"("subtest", "order", "isPractice");

-- CreateIndex
CREATE INDEX "CfitOption_questionId_idx" ON "CfitOption"("questionId");

-- CreateIndex
CREATE UNIQUE INDEX "Token_token_key" ON "Token"("token");

-- CreateIndex
CREATE UNIQUE INDEX "Admin_username_key" ON "Admin"("username");

-- AddForeignKey
ALTER TABLE "Peserta" ADD CONSTRAINT "Peserta_tokenId_fkey" FOREIGN KEY ("tokenId") REFERENCES "Token"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TestSession" ADD CONSTRAINT "TestSession_pesertaId_fkey" FOREIGN KEY ("pesertaId") REFERENCES "Peserta"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JawabanKraepelin" ADD CONSTRAINT "JawabanKraepelin_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "TestSession"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "KraepelinLog" ADD CONSTRAINT "KraepelinLog_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "TestSession"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CfitOption" ADD CONSTRAINT "CfitOption_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "CfitQuestion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TestAttempt" ADD CONSTRAINT "TestAttempt_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "TestSession"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JawabanPeserta" ADD CONSTRAINT "JawabanPeserta_attemptId_fkey" FOREIGN KEY ("attemptId") REFERENCES "TestAttempt"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JawabanCfit" ADD CONSTRAINT "JawabanCfit_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "TestSession"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JawabanDisc" ADD CONSTRAINT "JawabanDisc_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "TestSession"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
