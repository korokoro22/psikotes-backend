import { Router } from "express";
import adminRoutes from "./admin.routes"
import authRoutes from "./auth.routes"
import pesertaRoutes from "./peserta.routes"
import { authMiddleware } from "../middlewares/auth.middleware";

const router = Router()


router.use('/admin', authMiddleware, adminRoutes)
router.use('/auth', authRoutes)
// router.use('/questions', )
router.use('/user', pesertaRoutes)

// router.use('/')

export default router