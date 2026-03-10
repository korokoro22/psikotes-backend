-- CreateTable
CREATE TABLE "JawabanDisc" (
    "id" SERIAL NOT NULL,
    "sessionId" INTEGER NOT NULL,
    "questionIndex" INTEGER NOT NULL,
    "p1" INTEGER NOT NULL,
    "p2" INTEGER NOT NULL,
    "p3" INTEGER NOT NULL,
    "p4" INTEGER NOT NULL,
    "k1" INTEGER NOT NULL,
    "k2" INTEGER NOT NULL,
    "k3" INTEGER NOT NULL,
    "k4" INTEGER NOT NULL,

    CONSTRAINT "JawabanDisc_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "JawabanDisc" ADD CONSTRAINT "JawabanDisc_sessionId_fkey" FOREIGN KEY ("sessionId") REFERENCES "TestSession"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
