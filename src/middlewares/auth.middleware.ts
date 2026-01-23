import { NextFunction, Request, Response } from "express";
import jwt from "jsonwebtoken"

export const authMiddleware = (req: any, res: any, next:NextFunction) => {
    
    const cookie = req.cookies.access_token
    console.log(cookie)
    if(!cookie) {
        return res.status(401).json({
            message: 'Unauthorized. No token provided.'
        })    
    }

    try {
        const decoded = jwt.verify(cookie, process.env.ACCESS_TOKEN_SECRET!)
        req.user = decoded
        // console.log(req.user)
        next()

    } catch (err) {
        return res.status(401).json({
            message: 'Unauthorized. Invalid or expired token.'
        })
    }
}