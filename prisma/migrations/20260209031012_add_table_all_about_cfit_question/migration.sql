-- CreateTable
CREATE TABLE "CfitQuestion" (
    "id" SERIAL NOT NULL,
    "subtest" INTEGER NOT NULL,
    "order" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CfitQuestion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CfitQuestioImages" (
    "id" SERIAL NOT NULL,
    "questionId" INTEGER NOT NULL,
    "order" INTEGER NOT NULL,
    "imagePath" INTEGER NOT NULL,

    CONSTRAINT "CfitQuestioImages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CfitOption" (
    "id" SERIAL NOT NULL,
    "questionId" INTEGER NOT NULL,
    "label" TEXT NOT NULL,

    CONSTRAINT "CfitOption_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CfitOptionImage" (
    "id" SERIAL NOT NULL,
    "optionId" INTEGER NOT NULL,
    "order" INTEGER NOT NULL,
    "imagePath" TEXT NOT NULL,

    CONSTRAINT "CfitOptionImage_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "CfitQuestion_subtest_order_key" ON "CfitQuestion"("subtest", "order");

-- CreateIndex
CREATE INDEX "CfitQuestioImages_questionId_idx" ON "CfitQuestioImages"("questionId");

-- CreateIndex
CREATE UNIQUE INDEX "CfitQuestioImages_questionId_order_key" ON "CfitQuestioImages"("questionId", "order");

-- CreateIndex
CREATE INDEX "CfitOption_questionId_idx" ON "CfitOption"("questionId");

-- CreateIndex
CREATE INDEX "CfitOptionImage_optionId_idx" ON "CfitOptionImage"("optionId");

-- CreateIndex
CREATE UNIQUE INDEX "CfitOptionImage_optionId_order_key" ON "CfitOptionImage"("optionId", "order");

-- AddForeignKey
ALTER TABLE "CfitQuestioImages" ADD CONSTRAINT "CfitQuestioImages_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "CfitQuestion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CfitOption" ADD CONSTRAINT "CfitOption_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "CfitQuestion"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CfitOptionImage" ADD CONSTRAINT "CfitOptionImage_optionId_fkey" FOREIGN KEY ("optionId") REFERENCES "CfitOption"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
