const mongoose = require('mongoose');
const db = require('../config/db');


const materialsSchema = mongoose.Schema({
    name:{
        required:true,
        type:String,
        trim:true
    },
    subtitle:{
        required:true,
        type:String,
        trim:true
    },
    link:{
        required:true,
        type:String,
    }
});

const MaterialModel = db.model('material',materialsSchema);
module.exports = MaterialModel;