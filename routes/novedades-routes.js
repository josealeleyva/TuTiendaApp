const express = require('express');
const router = express.Router();

const novedades = require('../models/novedades');

router.get('/', (req, res)=>{
    novedades.list((err, novedades)=>{
        res.json(novedades);
    });
})

router.get('/:idNovedad', (req, res)=>{
    
    novedades.detailNovedad(req.params.idNovedad, (err, detailNovedad)=>{
        res.json(detailNovedad);
    });
})

module.exports = router;