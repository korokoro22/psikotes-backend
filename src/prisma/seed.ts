import { PrismaClient } from '@prisma/client';
import { cfitSeed } from './seeds/cfit'
import { adminSeed } from './seeds/admin';

const prisma = new PrismaClient();

async function main() {
    // await adminSeed()
    await cfitSeed()
}

main()
  .catch(console.error)
  .finally(() => prisma.$disconnect());