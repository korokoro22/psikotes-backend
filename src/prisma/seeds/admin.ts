import { PrismaClient } from "@prisma/client";
import bcrypt from 'bcrypt'

const prisma = new PrismaClient()

const adminSeed = async () => {
    // seed untuk buat admin
    const plainPassword = '123456';
    const hashedPassword = await bcrypt.hash(plainPassword, 10);

    await prisma.admin.create({
        data: {
            username: 'admin3',
            password: hashedPassword
        }
    });
}

export {adminSeed}