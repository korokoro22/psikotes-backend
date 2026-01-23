import { fetchToken, postToken, tokenNonactive } from "../services/token.service"


export const getToken = async (req:any, res:any) => {
    const tokenList = await fetchToken()
    
    const status = tokenList.success? 200 : 204
    return res.status(status).json({
        message: tokenList.message,
        data: tokenList.data
    })
}

export const addToken = async (req:any, res:any) => {
    const token = await postToken(req.body, res)
    // console.log(req.body)
    // const token = await postToken()
}

export const spesificToken = async (req:any, res:any) => {
    const id = req.params.id

    return console.log(id)
}

export const nonactiveToken = async (req:any, res:any) => {
    const id = Number(req.params.id)
    const statusActive = req.body
    console.log('ini contriller:', statusActive)
    const token = await tokenNonactive(id, res, statusActive)
    const status = token.success? 200 : 404

    return res.status(status).json({
        message: token.message,
        data: token.data
    })
}