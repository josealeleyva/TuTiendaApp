//Imports
const express = require('express');
const router = express.Router();
const novedadesController = require('../controller/novedades.controller')

//Routes
router.get('/', novedadesController.getList)
router.get('/:idNovedad', novedadesController.getNovedad)

//Export
module.exports = router;