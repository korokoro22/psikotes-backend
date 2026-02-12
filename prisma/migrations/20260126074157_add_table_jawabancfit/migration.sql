-- CreateTable
CREATE TABLE "JawabanCfit" (
    "id" SERIAL NOT NULL,
    "sessionId" INTEGER NOT NULL,
    "subtest" INTEGER NOT NULL,
    "questionId" INTEGER NOT NULL,
    "answer" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "JawabanCfit_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "JawabanCfit" ADD CONSTRAINT "JawabanCfit_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "TestSession"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
