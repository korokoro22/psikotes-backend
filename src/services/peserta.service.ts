import { postPeserta, getPeserta , getDetail} from "../models/peserta.model"
import { addCount, getSpecificToken } from "../models/token.model"

export const pesertaPost = async (post:any, res:any) => {
    const postToken = post.tokenPeserta
    const token = await getSpecificToken(postToken)

    if (token === null|| token == undefined || !token ) {
        return {
            success: false,
            status: 401,
            message: 'Token tidak sesuai'
        }
    } else {
        if (token.isActive === false) {
            return {
                success: false,
                status: 401,
                message: 'Token tidak aktif'
            }
        }

        if (token.usedCount < token.kuota){
            const postResult = await postPeserta(post, res, token.id)
            const usedCount = await addCount(token.id)

            const sessionId = postResult.testSession?.[0]?.id

            if (!sessionId) {
                return{
                    success: false,
                    status: 500,
                    message: 'Gagal memuat sesi ujian'
                }
            }
            return {
                success: true,
                status: 201,
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
                success: true,
                status: 401,
                message: 'Kuota telah melebihi batas'
            }
        }
        

        
    }
}

export const pesertaGetAll = async () => {
    const peserta = await getPeserta()
    
    if(peserta === null || peserta === undefined) {
        return {
            success: false,
            status: 403,
            message: 'data tidak ditemukan'
        }
    } else {
        return {
            success: true,
            status: 201,
            message: 'Data ditemukan',
            data: peserta
        }
    }
}

export const pesertaGetDetail = async (id:number, res:any) => {
    const peserta = await getDetail(id, res)

    if (peserta === null) {
        return ({
            status: 400,
            success: false,
            message: 'Data tidak ditemukan'
        })
    } else {
        return({
            status: 201,
            success: true,
            message: 'Data ditemukan',
            data: peserta
        })
    }
}