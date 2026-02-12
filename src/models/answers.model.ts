import { PrismaClient } from "@prisma/client"

const prisma = new PrismaClient

type CfitAnswerPayload = {
    questionId: number
    answers: string[]
    subtest: number
}

type DiscAnswerPayload = {
    questionId: number
    most: string
    least: string
    sessionId: number
}

export const answersCfitModel = async (data:any, sessionId: number) => {
    const payload: CfitAnswerPayload[] = data
    return await prisma.jawabanCfit.createMany({
            // data: [...data, sessionId],
            data: payload.map(item => ({
                ...item,
                sessionId: Number(sessionId)
                // sessionId: Number(sessionId) //ubah sessionId ke number!!!!
                })),
            skipDuplicates: true
        })
}

export const answersDiscModel = async (data:any, res:any) => {
    const payload: DiscAnswerPayload[] = data
    // console.log('ini model:', data)
    return await prisma.jawabanDisc.createMany({
        data: payload.map(item => ({
            ...item
        })),
        skipDuplicates: true
    })
}