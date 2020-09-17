const express = require('express');
const app = express();
const morgan = require('morgan');
const path = require('path');

//settings
app.set('port', process.env.PORT || 3500);

//middleware
app.use(morgan('dev'));
app.use(express.json());

//global variables
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
