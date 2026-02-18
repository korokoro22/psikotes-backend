import { Router } from "express";
import { n8nCfit, triggerN8N } from "../controllers/n8n.controller";

const router = Router()

router.get('/cfit/:pesertaId', n8nCfit)
router.post('/cfit/:pesertaId', triggerN8N)

export default router