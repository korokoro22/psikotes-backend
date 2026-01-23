import { pesertaPost, pesertaGetAll, pesertaGetDetail } from "../services/peserta.service"

export const postPeserta = async (req:any, res:any) => {
    const peserta = await pesertaPost(req.body, res)

    return res.status(peserta.status).json({
        success: peserta.status,
        message: peserta.message,
        data: peserta?.data
    })
}

export const getAllPeserta = async (req: any, res:any) => {
    const peserta = await pesertaGetAll()

    return res.status(peserta.status).json({
        message: peserta.message,
        data: peserta?.data
    })
}

export const getDetailPeserta = async (req: any, res:any) => {
    const id = Number(req.params.id)
    // console.log(id)
    const peserta = await pesertaGetDetail(id, res)

    return res.status(peserta.status).json({
        message: peserta.message,
        data: peserta.data
    })
}