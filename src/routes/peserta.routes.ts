import { Router } from "express";
import { postPeserta} from "../controllers/peserta.controller";

const router = Router()

router.post('/peserta', postPeserta)

export default router