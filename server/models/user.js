const mongoose =  require('mongoose');


const userSchema = mongoose.Schema({
    name:{
        required:true,
        type:String,
        trim:true,

    },
    phone:{
        required:true,
        type:String,
        trim:true,
        validator:(value)=>{
            return value.length >= 10;
        },
        message:"please enter a valid phone number"
    },
    borrow:{
        required:false,
        type:Object,
    }
});

const User = mongoose.model('User' , userSchema);
module.exports = User;