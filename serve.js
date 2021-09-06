const express = require('express');
const path = require('path');

const app = express();
const port = process.env.PORT || 8080;

// sendFile will go here
app.get('/platform-agent', function(req, res) {
  res.sendFile(path.join(__dirname, '/index.html'));
});
// sendFile will go here
app.get('/sdn-agent', function(req, res) {
  res.sendFile(path.join(__dirname, '/index.html'));
});
app.listen(port);
console.log('Server started at http://localhost:' + port)