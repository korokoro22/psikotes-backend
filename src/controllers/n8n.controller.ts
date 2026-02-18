import { 
    n8nCfitService,
    triggerN8NService
} from "../services/n8n.service" 

export const n8nCfit = async (req:any, res:any) => {
    const pesertaId = req.params.pesertaId
    const n8n = await n8nCfitService(req, res, pesertaId)

    if (!(n8n.status)) {
        return res.status(400).json(n8n)
    }
    // console.log(n8n)

    return res.status(201).json(n8n)
}

export const triggerN8N = async (req: any, res: any) => {
    const pesertaId = req.params.pesertaId;

    // Response ke frontend SEGERA
    res.status(200).json({
        status: true,
        message: 'N8N trigger initiated'
    });

    // Trigger N8N di background (non-blocking)
    triggerN8NService(Number(pesertaId))
        .then(result => {
            if (result.status) {
                console.log(`✅ N8N triggered for peserta ${pesertaId}`);
            } else {
                console.error(`❌ N8N trigger failed for peserta ${pesertaId}`);
            }
        })
        .catch(error => {
            console.error(`❌ Unexpected error:`, error);
        });
};