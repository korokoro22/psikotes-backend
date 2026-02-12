/*
  Warnings:

  - A unique constraint covering the columns `[subtest,order,isPractice]` on the table `CfitQuestion` will be added. If there are existing duplicate values, this will fail.

*/
-- DropIndex
DROP INDEX "CfitQuestion_subtest_order_key";

-- CreateIndex
CREATE UNIQUE INDEX "CfitQuestion_subtest_order_isPractice_key" ON "CfitQuestion"("subtest", "order", "isPractice");
