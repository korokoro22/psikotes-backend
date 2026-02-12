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

-- CreateIndex
CREATE UNIQUE INDEX "CfitQuestion_subtest_order_isPractice_key" ON "CfitQuestion"("subtest", "order", "isPractice");

-- CreateIndex
CREATE INDEX "CfitOption_questionId_idx" ON "CfitOption"("questionId");

-- AddForeignKey
ALTER TABLE "CfitOption" ADD CONSTRAINT "CfitOption_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "CfitQuestion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
