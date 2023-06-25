const mongoose =  require('mongoose');


const userSchema = mongoose.Schema({
    name:{
        required:true,
        type:String,
        trim:true,

    },
    email:{
        required:true,
        type:String,
        trim:true,
        validator:(value)=>{
            return value.length >= 10;
        },
        message:"please enter a valid phone number"
    },
});

const User = mongoose.model('User' , userSchema);
module.exports = User;