const mysql = require('mysql');

module.exports = ()=>{
    return mysql.createConnection({
        host: 'by8fzaibeqqxovwshhex-mysql.services.clever-cloud.com',
        user: 'ujfivcgimftghkzd',
        password: '3S9spsbhLZFDYfAvwc1F',
        database: 'by8fzaibeqqxovwshhex'
    })
}