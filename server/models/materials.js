const mongoose = require('mongoose');
const db = require('../config/db');


const materialsSchema = mongoose.Schema({
    name:{
        required:true,
        type:String,
        trim:true
    },
    link:{
        required:true,
        type:String,
        trim:true
    }
});

const MaterialModel = db.model('material',materialsSchema);
module.exports = MaterialModel;