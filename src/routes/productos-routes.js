//Imports
const express = require('express');
const router = express.Router();
const productosController = require('../controller/productos.controller');

//Routes
router.get('/', productosController.getListExtended);
router.get('/list', productosController.getList);

//Exports
module.exports = router;