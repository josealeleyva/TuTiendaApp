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

module.exports = novedades;