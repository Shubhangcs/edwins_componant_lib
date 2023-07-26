const rout = require('express').Router();
const db = require('../config/db');
const mongoose = require('mongoose');
const compSchema = require('../models/componants');


module.exports = rout.get('/componant', async (req, res) => {
  try {
    const collection = db.collection('componants'); 

    const data = await collection.find().toArray();
    res.json(data);
  } catch (error) {
    console.error('Failed to retrieve data from MongoDB:', error);
    res.status(500).send('Failed to retrieve data from MongoDB');
  }
});


module.exports = rout.post('/addcomp', (req, res) => {
  // Extract the list of items from the request body
  const { name , image , subtitle} =  req.body;
  const post =new compSchema({
    name,
    image,
    subtitle
  })
  post.save().then(savedPost => {
    res.json(savedPost);
  })
  .catch(error => {
    res.status(500).json({ error: 'An error occurred' });
  });
});
