const http = require('http');
const express = require('express');
const path = require('path');

// Constants
const PORT = 8080;
const HOST = '0.0.0.0';

// App
const app = express();
app.use(express.json());
app.use(express.static("express"));

app.get('/', (req, res) => {
  res.send('Teste para Opeshift 4.8\n');
});

app.use('/page1', function(req,res){
  res.sendFile(path.join(__dirname+'/index.html'));
  //__dirname : It will resolve to your project folder.
});

const server = http.createServer(app);

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
