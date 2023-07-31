const rout = require('express').Router();
const db = require('../config/db');
const mongoose = require('mongoose');
const compSchema = require('../models/componants');


module.exports = rout.get('/getcomponent', async (req, res) => {
  try {
    const collection = db.collection('componants'); 

    const data = await collection.find().toArray();
    res.json(data);
  } catch (error) {
    
  }
});


module.exports = rout.post('/addcomponent', (req, res) => {
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

module.exports = rout.post('/getcomponent/delete' ,async (req , res) => {
    const name  = req.body;
    console.log(name);
    const collection =  db.collection('componants');

    const data = await collection.deleteOne(name);
    res.json(data);
});
