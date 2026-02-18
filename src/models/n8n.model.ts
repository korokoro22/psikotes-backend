import { PrismaClient } from "@prisma/client"

const prisma = new PrismaClient()

export const n8nCfitModel = async (id:number) => {
    return await prisma.peserta.findUnique({
        where: {
            id: Number(id)
        },
        select: {
            nama: true,
            email:true,
            jenisKelamin: true,
            usia: true,
            pendidikanTerakhir: true,
            unit: true,
            posisi:true,
            jurusan: true,
            testSession: {
                select: {
                    jawabanCfit: {
                        select: {
                            id: true,
                            sessionId: true,
                            subtest: true,
                            questionId: true,
                            answers: true
                        }
                    }
                }
            }
        }
    })
}