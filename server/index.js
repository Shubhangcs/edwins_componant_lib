const app = require('./app');
const db = require('./config/db');
const UserModel = require('./models/user');
const CompModel = require('./models/componants');
const port = 3000;

app.listen(port , ()=>{
    console.log('Server is startd...');
});
