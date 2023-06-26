const app = require('./app');
const db = require('./config/db');
const UserModel = require('./models/user');
const port = 3000;

app.listen(port , ()=>{
    console.log('Server is startd...');
});