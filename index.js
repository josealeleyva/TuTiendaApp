const express = require('express');
const app = express();
const morgan = require('morgan');
const path = require('path');
const cors = require('cors')

//settings
app.set('port', process.env.PORT || 3500);

//middleware
app.use(morgan('dev'));
app.use(express.json());
app.use(cors())

//global variables
app.use((req, res, next)=>{
    res.header("Access-Control-Allow-Origin","*");
    res.header('Access-Control-Allow-Headers', 'X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Allow-Request-Method, Authorization');
    res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
    res.header('Allow', 'GET, POST, OPTIONS, PUT, DELETE');
    next();
});
app.use((req, res, next)=>{
    next();
});

//routes
app.use(require('./routes/index'))
app.use('/novedades',require('./routes/novedades-routes'))
app.use('/productos',require('./routes/productos-routes'))

//Server listen
app.listen(app.get('port'),()=>{
    console.log("Servidor escuchando en el puerto ", app.get('port'))
});
