const mongoose = require('mongoose');
const db = require('../config/db');

const newStudentSehema = mongoose.Schema({
    name:{
        required: true,
        type: String,
        trim:true
    },
    year:{
        required:true,
        type: String,
        trim:true
    },
    reason:{
        required:true,
        type: String,
        trim:true
    },
    laptop:{
        required:true,
        type: bool,

    }
});

