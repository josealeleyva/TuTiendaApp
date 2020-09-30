//Imports
const productos = require('../models/productos');

//Controller
productosController = {};

//Methods
productosController.getListExtended = (req, res)=>{
    productos.listExtended((err, productos)=>{
         res.json(productos)
    });
 };

productosController.getList = (req, res)=>{
    productos.list((err, productos)=>{
         res.json(productos)
    });
 }; 

//Export
module.exports = productosController