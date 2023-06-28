const router = require('express').Router();
const UserController = require('../controller/user_cont');

router.post('/registration',UserController.register);
router.post('/login',UserController.login);

module.exports = router; 