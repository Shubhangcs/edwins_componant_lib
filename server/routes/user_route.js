const router = require('express').Router();
const UserController = require('../controller/user_cont');

router.post('/registration',UserController.register);

module.exports = router;