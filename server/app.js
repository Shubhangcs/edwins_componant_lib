const express = require('express');
const body_parser = require('body-parser');
const UserRoute = require('./routes/user_route');
const CompRouter = require('./routes/comp_router');
const app = express();
app.use(body_parser.json());
app.use('/' , UserRoute);
app.use('/main',CompRouter);

module.exports = app;
