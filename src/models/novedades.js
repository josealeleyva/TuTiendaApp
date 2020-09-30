const dbConnection = require('../config/dbConnection');
const connection = dbConnection();

let novedades = {};

novedades.list = (callback) => {
    if (connection) {
        connection.query('SELECT * FROM novedad',
            (err, novedades) => {
                if (err) {
                    throw err
                }
                else {
                    callback(null, novedades)
                }
            }
        );
    };
};

novedades.detailNovedad = (codigoNovedad, callback) => {
    if (connection) {
        connection.query('SELECT * from novedad JOIN productopromocion on productopromocion.codigoNovedad = novedad.codigoNovedad JOIN catalogo on catalogo.codigoCatalogo = productopromocion.codigoCatalogo JOIN producto on producto.codigoProducto = catalogo.codigoProducto WHERE novedad.codigoNovedad = '+codigoNovedad,
            (err, detailNovedad) => {
                if (err) {
                    throw err
                }
                else {
                    callback(null, detailNovedad)
                }
            }
        );
    };
};

module.exports = novedades;