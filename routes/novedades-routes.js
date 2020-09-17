const express = require('express');
const router = express.Router();

const novedades = require('../models/novedades');

router.get('/', (req, res)=>{
    novedades.list((err, novedades)=>{
        res.json(novedades);
    });
})

module.exports = router;