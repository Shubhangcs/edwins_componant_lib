const rout = require('express').Router();
const db = require('../config/db');


rout.get('/componant', async (req, res) => {
  try {
    const collection = db.collection('componants'); // Replace 'mycollection' with your collection name

    const data = await collection.find().toArray();
    res.json(data);
  } catch (error) {
    console.error('Failed to retrieve data from MongoDB:', error);
    res.status(500).send('Failed to retrieve data from MongoDB');
  }
});

module.exports = rout;

