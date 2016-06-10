require('bootstrap-webpack');
require('font-awesome/css/font-awesome.css');
require('./css/style.css');
var example = require('./images/img-example.png');

var app = require('./elm/Main');
app.Main.fullscreen();
