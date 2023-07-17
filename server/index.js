const app = require('./app');
const cors=require("cors");
const db = require('./config/db');
const UserModel = require('./models/user');
const CompModel = require('./models/componants');
const UserComponants = require('./models/user_componants');
const port = 3000;

app.use(cors({
    origin:"http://localhost:62713",
}));
app.listen(port , ()=>{
    console.log('Server is startd...');
});
