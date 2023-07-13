const mongoose = require('mongoose');
const db = require('../config/db');


const componantSchema = mongoose.Schema({
    name:{
        required:true,
        type:String,
        trim:true
    },
    image:{
        required:true,
        type:String,
        trim:true
    },
    subtitle:{
        required:true,
        type:String,
        trim:true
    },

});

const CompModel = db.model('componant',componantSchema);
module.exports = CompModel;
