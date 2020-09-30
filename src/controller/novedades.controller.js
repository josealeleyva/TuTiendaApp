//Imports
const novedades = require('../models/novedades');

//Controller
const novedadesController = {};


//methods
novedadesController.getList = (req, res)=>{
    novedades.list((err, novedades)=>{
        res.json(novedades);
    });
};

novedadesController.getNovedad = (req, res)=>{
    
    novedades.detailNovedad(req.params.idNovedad, (err, detailNovedad)=>{
        res.json(detailNovedad);
    });
};


//Export
module.exports = novedadesController;