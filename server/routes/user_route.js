const UserController = require('../controller/user_cont');
const rou = require('express').Router();

module.exports = rou.post('/registration',UserController.register);
module.exports = rou.post('/login',UserController.login);


