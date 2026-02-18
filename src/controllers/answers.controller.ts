import { answersCfitService, answersDiscService } from "../services/answers.service"

// CFIT
export const answersCfit = async (req:any, res:any) => {
    const sessionId = req.params.id
    const answers = await answersCfitService(req.body, res, sessionId)
    if(!answers.status) {
        return res.status(400).json(answers)
    }
    return res.status(201).json(answers)
}

// DISC
export const answersDisc = async (req:any, res:any) => {
    const sessionId = req.params.id
    const data = req.body
    const answers = await answersDiscService(data, sessionId, res)

    if(!answers.status) {
        return res.status(400).json(answers)
    }

    return res.status(201).json(answers)
}