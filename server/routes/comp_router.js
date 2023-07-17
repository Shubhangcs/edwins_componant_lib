const rout = require('express').Router();
const db = require('../config/db');


rout.get('/componant', async (req, res) => {
  try {
    const collection = db.collection('componants'); 

    const data = await collection.find().toArray();
    res.json(data);
  } catch (error) {
    console.error('Failed to retrieve data from MongoDB:', error);
    res.status(500).send('Failed to retrieve data from MongoDB');
  }
});

rout.get("/test",(req,res)=>{
  res.send("hello world");
})
module.exports = rout;

