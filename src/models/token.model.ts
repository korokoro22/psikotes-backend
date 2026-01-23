import { PrismaClient } from "@prisma/client";
import { generateTestToken } from "../utils/token.utils";

const prisma = new PrismaClient

//read token (semua)
export const tokenList = async () => {
    const listToken = await prisma.token.findMany({
        select: {
            id:true,
            token: true,
            tests: true,
            kuota: true,
            isActive: true
        }
    })
    return listToken
}

//read token (spesifik (token) )
export const getSpecificToken = async (tokenInput:string) => {
        const getToken = await prisma.token.findUnique({
            where: {
                token: tokenInput
            },
            select: {
                token: true,
                tests: true,
                usedCount: true,
                kuota: true,
                id: true,
                isActive: true
            }
        })
        return getToken
}

//tambah token
export const tokenPost = async (postToken:any, res:any) => {
    const newToken = await prisma.token.create({
        data: {
            token: generateTestToken(5),
            tests: postToken.tests,
            kuota: postToken.kuota
        }
    })

    return res.status(200).json({
        message: 'data berhasil ditambahkan'
    })
}

export const nonactiveToken = async (id:number, res:any, statusActive:any) => {
    try {
        const tokenDelete = await prisma.token.update({
            where: {
                id: id
            },
            data: {
                isActive: statusActive.status
            }
        })

        return ({
            success: true,
            message: 'Berhasil dihapus.',
            data: tokenDelete
        })
    } catch(error) {
        console.log(error)
        return ({
            success: false,
            message: error
        })
    }
}

export const addCount = async (id: any) => {
    const countUpdate = await prisma.token.update({
        where: {
            id: id,
        },
        data: {
            usedCount: {increment: 1}
        }
    })
}