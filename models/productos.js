const dbConnection = require('../config/dbConnection');
const connection = dbConnection();

let productos = {};

productos.list = (callback) => {
    if (connection) {
        connection.query('SELECT * FROM catalogo',
            (err, productos) => {
                if (err) {
                    throw err
                }
                else {
                    callback(null, productos)
                }
            }
        );
    };
};

productos.listExtended = (callback) => {
    if (connection) {
        connection.query('SELECT * FROM catalogo JOIN producto ON catalogo.codigoProducto = producto.codigoProducto join tienda ON tienda.codigoTienda = catalogo.codigoTienda',
            (err, productos) => {
                if (err) {
                    throw err
                }
                else {
                    callback(null, productos)
                }
            }
        );
    };
};

module.exports = productos;