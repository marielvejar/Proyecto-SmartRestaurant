const express = require('express');
const bodyparser = require('body-parser');
// express se empieza a utilizar y app es el servidors
const app = express();
const cors = require('cors');
const mysql = require('mysql2');
const { Console } = require('console');

app.use(cors());
app.use(bodyparser.json());

//conectar a base de datos mysql
const db = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'sushidb',
  port: 3306
});

// revisa la coneccion a la base de datos
db.connect(err => {
  if (err) { console.log('err'); }
  console.log('base de datos conectado...');
})


/*app.get('/', (req, res)=> {
  res.send('Hello World');
});*/

//conseguir todos los datos de producto
app.get('/producto', (req, res) => {
  let qr = 'select * from producto';
  db.query(qr, (err, result) => {
    if (err) {
      console.log(err, 'errs');
    }
    if (result.length > 0) {
      res.send({
        message: 'datos de los productos',
        data: result
      });
    }
  });
});

// crear dato producto
app.post('/producto', (req,res)=>{
  console.log(req.body, 'crea dato');

  let nombre = req.body.nombre;
  let imagen = req.body.imagen;
  let valor = req.body.valor;
  let descripcion = req.body.descripcion;
  let stock = req.body.stock;
  let categoria = req.body.categoria;

  let qr = `insert into producto(nombre, imagen, valor, descripcion, stock, categoria)
              values('${nombre}','${imagen}','${valor}','${descripcion}',
              '${stock}','${categoria}')`;

  console.log(qr, 'qr')
     db.query(qr,(err,result)=>{
          if(err){console.log(err)};
          console.log(result,'result')
          res.send({
            message: 'dato insertado',
          });
  });
});

//conseguir las mesas
app.get('/mesa', (req, res) => {
  let qr = 'select * from mesa;'
  db.query(qr, (err, result) => {
    if (err) {
      console.log(err, 'errs');
    }
    if (result.length > 0) {
      res.send({
        message: 'datos de las mesas',
        data: result
      });
    }
  });
});


// Añadir mesa
app.post('/mesa', (req, res) => {
  console.log(req.body, 'Añadir mesa');

  let mesa_id = req.body.mesa_id;
  let comanda_id = req.body.comanda_id;

  let qr = `insert into mesa(mesa_id, comanda_id) values('${mesa_id}','${comanda_id}) `;

  console.log(qr, 'qr')
  db.query(qr, (err, result) => {
    if (err) { console.log(err) };
    console.log(result, 'result')
    res.send({
      message: 'dato insertado',
    });
  });
});

// Actualizar mesa
app.put('/mesa/:id', (req,res)=>{
  console.log(req.body, 'actualiza dato');

  let gID = req.params.id;

  db.query(qr,(err,result)=>{
          if(err) {console.log(err);}

          res.send({
              message:'dato actualizado'
          });
  });
});

// Conseguir comanda
app.get('/comanda', (req, res) => {
  let qr = 'select * from comanda;'
  db.query(qr, (err, result) => {
    if (err) {
      console.log(err, 'errs');
    }
    if (result.length > 0) {
      res.send({
        message: 'datos de las comandas',
        data: result
      });
    }
  });
});


//Añadir comanda -> AQUI EMPIEZA EL PEDIDO
app.post('/comanda', (req, res) => {
  console.log(req.body, 'Añadir comanda');

  let comanda_id = req.body.comanda_id;

  let qr = `insert into comanda(comanda_id) values('${comanda_id}') `;

  console.log(qr, 'qr')
  db.query(qr, (err, result) => {
    if (err) { console.log(err) };
    console.log(result, 'result')
    res.send({
      message: 'dato insertado',
    });
  });
});

//Actualizar una comanda
app.put('/comanda/:id', (req,res)=>{
  console.log(req.body, 'actualiza dato');

  let gID = req.params.id;

  db.query(qr,(err,result)=>{
          if(err) {console.log(err);}

          res.send({
              message:'dato actualizado'
          });
  });
});


// Conseguir todos los datos del staff
app.get('/staff', (req, res) => {
  let qr = 'select * from staff;'
  db.query(qr, (err, result) => {
    if (err) {
      console.log(err, 'errs');
    }
    if (result.length > 0) {
      res.send({
        message: 'datos del staff',
        data: result
      });
    }
  });
});


//Conseguir todos los datos de los usuarios
app.get('/user', (req, res) => {
  let qr = 'select * from user;'
  db.query(qr, (err, result) => {
    if (err) {
      console.log(err, 'errs');
    }
    if (result.length > 0) {
      res.send({
        message: 'datos de las usuarios',
        data: result
      });
    }
  });
});

// Crear usuario
app.post('/user', (req, res) => {
  console.log(req.body, 'Añadir usuario');

  let user_id = req.body.user_id;
  let username = req.body.username;
  let password = req.body.password;
  let email = req.body.email

  let qr = `insert into user(username, password, email)
  values('${username}','${password}','${email}')`;

  console.log(qr, 'qr')
  db.query(qr, (err, result) => {
    if (err) { console.log(err) };
    console.log(result, 'result')
    res.send({
      message: 'dato insertado',
    });
  });
});

//Conseguir productos alcoholicos
app.get('/productosalcoholicos', (req, res) => {
  let qr = 'select * from productosalcoholicos';
  db.query(qr, (err, result) => {
    if (err) {
      console.log(err, 'errs');
    }
    if (result.length > 0) {
      res.send({
        message: 'datos de los productosalcoholicos',
        data: result
      });
    }
  });
});

//Conseguir productos alcoholicos
app.get('/productosbebestibles', (req, res) => {
  let qr = 'select * from productosbebestibles';
  db.query(qr, (err, result) => {
    if (err) {
      console.log(err, 'errs');
    }
    if (result.length > 0) {
      res.send({
        message: 'datos de los productosbebestibles',
        data: result
      });
    }
  });
});


//servidor corriendo
app.listen(8000, () => {
  console.log('server running...');
});

