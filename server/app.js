const express = require('express');
const cors=require("cors");
const body_parser = require('body-parser');
const UserRoute = require('./routes/user_route');
const CompRouter = require('./routes/comp_router');
const UserData = require('./routes/user_componants_router');
const MaterialsRout = require('./routes/material_router');
const app = express();
app.use(cors({
    origin:"http://localhost:56074"
}))
app.use(body_parser.json());
app.use('/auth' , UserRoute);
app.use('/components',CompRouter);
app.use('/comp',UserData)
app.use('/materials',MaterialsRout);

module.exports = app;
