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
        connection.query('SELECT * from productopromocion join catalogo ON catalogo.codigoCatalogo = productopromocion.codigoCatalogo join producto ON producto.codigoProducto = catalogo.codigoProducto where codigoNovedad ='+codigoNovedad,
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