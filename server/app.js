const express = require('express');
const body_parser = require('body-parser');
const UserRoute = require('./routes/user_route');
const CompRouter = require('./routes/comp_router');
const UserData = require('./routes/user_componants_router');
const app = express();
app.use(body_parser.json());
app.use('/' , UserRoute);
app.use('/main',CompRouter);
app.use('/comp',UserData)

module.exports = app;
