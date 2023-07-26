const UserController = require('../controller/user_cont');
const db = require('../config/db');
const rou = require('express').Router();

module.exports = rou.post('/registration',UserController.register);
module.exports = rou.post('/login',UserController.login);

module.exports = rou.get('/userdetails' ,  async(req , res) => {
    try {
      const data = db.collection('users');
      const col = await data.find().toArray();
      res.json(col);
      
    } catch (error) {
      console.error('Failed to retrieve data from MongoDB:', error);
      res.status(500).send('Failed to retrieve data from MongoDB');
    }
});

