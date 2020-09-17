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

module.exports = productos;