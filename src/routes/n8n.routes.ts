import { Router } from "express";
import { 
    triggerN8N,
    n8nCfit, 
    n8nKraepelin
 } from "../controllers/n8n.controller";

const router = Router()


router.post('/trigger/:pesertaId', triggerN8N)
router.get('/cfit/:pesertaId', n8nCfit)
router.get('/kraepelin/:pesertaId', n8nKraepelin)

export default router