const router = require('express').Router();
const db = require('../config/db');
const MaterialSchema = require('../models/materials');


module.exports = router.get('/getmaterials',async(req,res)=>{
    try {
        const collection = db.collection('materials');
        const data = await collection.find().toArray();
        res.json(data);
    } catch (error) {
        res.json({status:false});
    }
});

module.exports = router.post('/addmaterials' ,(req,res)=>{

    try {
        const {name , subtitle , link} = req.body;
        const add = new MaterialSchema({
            name,
            subtitle,
            link
        });
        add.save().then(savePost => {
            res.json(savePost);
        })
    } catch (error) {
        res.json({status:false});
    }
});