import { answersCfitModel, answersDiscModel } from "../models/answers.model"

type DiscAnswerInput = {
    groupId: number
    type: string
}

type DiscAnswerPayload = {
    questionId: number
    most: string
    least: string
}

export const answersCfitService = async (data:any, res:any, sessionId:number) => {
    try{
        const answers = await answersCfitModel(data, sessionId)
    // console.log('answers service: ', answers)
    return ({
        status: true,
        message: 'berhasil menyimpan jawaban',
        data: answers
    })
    } catch (error) {
        // console.log('ini error', error)
        return({
            status: false,
            message: error
        })
    }
}

export const answersDiscService = async (data:any, sessionId: number, res:any) => {
    const answersMost: DiscAnswerInput[] = data.most
    const most = answersMost.map(item=>({
        ...item,
        sessionId: Number(sessionId)
    }))

    const answersLeast: DiscAnswerInput[] = data.least
    const least = answersLeast.map(item=>({
        ...item,
        sessionId: Number(sessionId)
    }))
    const mergedArray = most.map( item1 => {
        const leastData = least.find(item2 => item2.groupId === item1.groupId)
        return ({
            questionId: item1.groupId,
            most: item1.type,
            least: leastData?.type,
            sessionId: item1.sessionId
        })
    })
    
    try {
        const answers = await answersDiscModel(mergedArray, res)
        return({
            status: true,
            message: 'berhasil menyimpan jawaban',
            data: answers
        })
    } catch(error) {
        return ({
            status: false,
            message: error
        })
    }


}