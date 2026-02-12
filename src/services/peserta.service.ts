import { postPesertaModel, getAllPesertaModel , getDetailPesertaModel, statusPesertaModel} from "../models/peserta.model"
import { addCount, getSpecificToken } from "../models/token.model"
export const postPesertaService = async (post:any, res:any) => {
    const postToken = post.tokenPeserta
    const token = await getSpecificToken(postToken)

    if (token === null|| token == undefined || !token ) {
        return {
            status: false,
            message: 'Token tidak sesuai'
        }
    } else {
        if (token.isActive === false) {
            return {
                status: false,
                message: 'Token tidak aktif'
            }
        }

        if (token.usedCount < token.kuota){
            const postResult = await postPesertaModel(post, res, token.id)
            const usedCount = await addCount(token.id)

            const sessionId = postResult.testSession?.[0]?.id

            if (!sessionId) {
                return{
                    status: false,
                    message: 'Gagal memuat sesi ujian'
                }
            }
            return {
                status: true,
                message: 'Token yang dimasukkan benar',
                // data: [postResult, token.tests]
                data: {
                    pesertaId: postResult.id,
                    sessionId: sessionId,
                    tests: postResult.token.tests
                }
            }
        } else {
            return {
                status: false,
                message: 'Kuota telah melebihi batas'
            }
        }
        

        
    }
}

export const getAllPesertaService = async () => {
    try {
        const peserta = await getAllPesertaModel()
        return ({
            status: true,
            message: 'data ditemukan',
            data: peserta
        })
    } catch (error) {
        return ({
            status: false,
            message: 'data tidak ditemukan'
        })
    }
}

export const getDetailPesertaService = async (id:number, res:any) => {
    try {
        const peserta = await getDetailPesertaModel(id, res)
        return ({
            status: true,
            message: 'data ditemukan',
            data: peserta
        })
    } catch(error) {
        return ({
            status: false,
            message: 'data tidak ditemukan'
        })
    }
    // if (peserta === null) {
    //     return ({
    //         status: false,
    //         message: 'Data tidak ditemukan'
    //     })
    // } else {
    //     return({
    //         status: false,
    //         message: 'Data ditemukan',
    //         data: peserta
    //     })
    // }
}

export const statusPesertaService = async (sessionId:number, res:any) => {    
    
    try {
        const peserta = await statusPesertaModel(sessionId, res)
        return ({
            status: true,
            message: 'status tes peserta berhasil diubah',
            data: peserta
        })
    } catch(error) {
        return({
            status: true,
            message: 'status tes peserta gagal diubah'
        })

    }
}