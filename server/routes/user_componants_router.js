const express = require('express');
const route = express.Router();
const db = require('../config/db');
const mongoose = require('mongoose');
const userComp = require('../models/user_componants');

module.exports = route.post('/addusercomponents', (req, res) => {
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

module.exports = route.get('/getuserdata' ,  async(req , res) => {
    try {
      const data = db.collection('usercomps');
      const col = await data.find().toArray();
      res.json(col);
      
    } catch (error) {
      res.json({status:false});
    }
});


