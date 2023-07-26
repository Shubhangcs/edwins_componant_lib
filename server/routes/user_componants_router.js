const express = require('express');
const route = express.Router();
const db = require('../config/db');
const mongoose = require('mongoose');
const userComp = require('../models/user_componants');

module.exports = route.post('/usercomp', (req, res) => {
  const { name ,items} =  req.body;
  const post =new userComp({
    name,
    items
  })

  try {
    post.save().then(savedPost => {
      res.json({status: true});
      });
  } catch (error) {
    res.send(500).json({status: false});
  }
});

module.exports = route.get('/userdata' ,  async(req , res) => {
    try {
      const data = db.collection('usercomps');
      const col = await data.find().toArray();
      res.json(col);
      
    } catch (error) {
      console.error('Failed to retrieve data from MongoDB:', error);
      res.status(500).send('Failed to retrieve data from MongoDB');
    }
});


