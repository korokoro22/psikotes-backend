import { nonactiveToken, tokenList, tokenPost } from "../models/token.model"

export const fetchToken = async () => {
    const dataToken = await tokenList()
    if (!dataToken) {
        return ({
            success: false,
            message: 'Data tidak ditemukan.'
        })
    }
    return ({
        success: true,
        message: 'Data ditemukan',
        data: dataToken
    })
}

export const postToken = async (postToken:any, res:any) => {
    // console.log('ini di service: ', postToken)
    const dataToken = await tokenPost(postToken, res)
}

export const tokenNonactive = async (id:any, res:any, statusActive:boolean) => {
    console.log('ini service:', statusActive)
    const deleteMessage = await nonactiveToken(id, res, statusActive)
    return deleteMessage
}