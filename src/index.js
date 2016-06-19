require('bootstrap-webpack');
require('font-awesome/css/font-awesome.css');
require('./css/style.css');
require('./css/admin.css');
var example = require('./images/img-example.png');
// window.Backand = require('./vendor/backand.js');
import Backand from './vendor/backand.js'


var app = require('./elm/Main').Main.fullscreen();;

const loginSuccess = (data, status) => {
  if(data.access_token){
    const userData = {
      message: '',
      accessToken : data.access_token,
      status
    }
    app.ports.loggedin.send(userData, true)
  }
}

const loginFail = (error, status) => {
  if(status !== 200) {
    const error_message = JSON.parse(error.responseText).error_description
    const userData = {
      message: error_message,
      accessToken : '',
      status
    }
    app.ports.loggedin.send(userData, false)
  }

}

app.ports.doLogin.subscribe( (args) => {
  const [username, password] = args
  Backand.security.signin(username, password, 'Huerto', loginSuccess, loginFail)
})
