//import packages
const express = require('express');
const mongoose = require('mongoose');

//relative imports
const authRouter = require('./routes/auth.js');

//constants
const app = express()   
const port = 3000
const url = "mongodb+srv://Shubhanga:shubhanga2003@cluster0.k5ydgmu.mongodb.net/";
app.use(express.json())
app.use(authRouter);

mongoose.connect(url).then(()=>{
    console.log('Connection successfull');
}).catch((e)=>{
    console.log(e);
})


app.listen(3000 , '0.0.0.0',()=>{
    console.log(`Connected to server at port ${port}`)
})