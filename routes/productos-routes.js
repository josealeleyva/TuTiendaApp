const express = require('express');
const router = express.Router();

const productos = require('../models/productos');

router.get('/', (req, res)=>{
   productos.listExtended((err, productos)=>{
        res.json(productos)
   })
})

router.get('/list', (req, res)=>{
   productos.list((err, productos)=>{
        res.json(productos)
   })
})

module.exports = router;