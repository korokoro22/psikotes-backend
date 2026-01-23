import { PrismaClient } from "@prisma/client"

const prisma = new PrismaClient

export const postPeserta = async (post:any, res:any, id:any) => {
    const pesertaPost = await prisma.peserta.create({
        data: {
            nama: post.nama,
            jenisKelamin: post.jenisKelamin,
            usia: post.usia,
            pendidikanTerakhir: post.pendidikanTerakhir,
            jurusan: post.jurusan,
            tokenId: id,
            
            testSession: {
                create : [
                    {
                    token: post.tokenPeserta,
                    statusTest: 0
                }
                ]
            }


        },
        include: {
            testSession: true,
            token: true
        }
    })

     

    return pesertaPost
}

export const getPeserta = async () => {
    try{
        const peserta = await prisma.peserta.findMany({
        select: {
            nama: true,
            id: true,
            // jenisKelamin: true,
            // usia: true,
            // pendidikanTerakhir: true,
            // jurusan: true,
            testSession: {
                select: {
                    statusTest: true
                }
            }
        }
    })
    return peserta
    } catch (err) {
        return {
            message: err
        }
    }
    

    // return peserta
}

export const getDetail = async (id:number, res:any) => {
    try{
        const peserta = await prisma.peserta.findUnique({
            where: {
                id: id
            },
            select: {
                nama: true,
                jenisKelamin: true,
                usia: true,
                pendidikanTerakhir: true,
                jurusan: true,

                testSession: {
                select: {
                    statusTest: true
                }
            }
            },
            
        })

    return peserta
    } catch (err) {
        return {
            message: err
        }
    }
}