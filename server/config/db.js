const mongoose = require('mongoose');
const dburl = 'mongodb://localhost:27017/edwin_comp_lib';

const connection = mongoose.createConnection(dburl).on('open',()=>{
    console.log('MongoDB Connected');
}).on('error',()=>{
    console.log('Mongo db connection error');
});



module.exports = connection;