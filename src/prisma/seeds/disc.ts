import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient()

const discSeed = async () => {
    const sentences = ''
    const questionIndex = 1
    const optionIndex = 1

    await prisma.discQuestion.create({
        data: {
            sentences: sentences,
            questionIndex: questionIndex,
            optionIndex: optionIndex
        }
    })
}