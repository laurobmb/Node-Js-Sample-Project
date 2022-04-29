const http = require('http');
const express = require('express');
const path = require('path');
var serveIndex = require('serve-index')

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();
app.use(express.json());
app.use(express.static("express"));
app.use('/img', express.static('img'));

app.get('/openshift', (req, res) => {
  res.send('Teste para Opeshift 4.8\n');
});

app.use('/files', express.static('data/'), 
serveIndex('data/', {'icons': true}))

app.get('/health', (req, res) => {
  const data = {
    uptime: process.uptime(),
    message: 'Ok',
    date: new Date()
  }
  res.status(200).send('Ok');
});

app.use('/', function(req,res){
  res.sendFile(path.join(__dirname+'/index.html'));
  //__dirname : It will resolve to your project folder.
});

const server = http.createServer(app);

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
