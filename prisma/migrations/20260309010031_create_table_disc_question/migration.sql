-- CreateTable
CREATE TABLE "DiscQuestion" (
    "id" SERIAL NOT NULL,
    "sentences" TEXT NOT NULL,
    "questionIndex" INTEGER NOT NULL,
    "optionIndex" INTEGER NOT NULL,

    CONSTRAINT "DiscQuestion_pkey" PRIMARY KEY ("id")
);
