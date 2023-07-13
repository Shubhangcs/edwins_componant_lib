const express = require('express');
const route = express.Router();
const mongoose = require('mongoose');
const userComp = require('../models/user_componants');

route.post('/usercomp', (req, res) => {
  // Extract the list of items from the request body
  const { name ,items} =  req.body;
  const post =new userComp({
    name,
    items
  })
  
console.log(post)
  post.save().then(savedPost => {
    res.json(savedPost);
  })
  .catch(error => {
    res.status(500).json({ error: 'An error occurred' });
  });
});

module.exports = route;