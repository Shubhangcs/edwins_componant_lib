const router = require('express').Router();
const db = require('../config/db');
const MaterialSchema = require('../models/materials');


module.exports = router.get('/materiall',async(req,res)=>{
    try {
        const collection = db.collection('materials');
        const data = await collection.find().toArray();
        res.json(data);
    } catch (error) {
        console.error('Failed to retrieve data from MongoDB:', error);
        res.status(500).send('Failed to retrieve data from MongoDB');
    }
});

module.exports = router.post('/materials' ,(req,res)=>{
    const {name , subtitle , link} = req.body;
    const add = new MaterialSchema({
        name,
        subtitle,
        link
    })
    add.save().then(savePost => {
        res.json(savePost);
    })
});