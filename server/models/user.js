const mongoose =  require('mongoose');
const bcrypt = require('bcrypt');
const db = require('../config/db')

const userSchema = mongoose.Schema({
  name:{
    required:true,
    type:String,
    trim:true,
  },
  email: {
    type: String,
    required: true,
    trim: true,
    lowercase: true,
    unique: true,
  },

    password:{
        required:true,
        type:String,
        trim:true,
    },
});



userSchema.pre('save',async function(){
  try {
    var user = this;
    const salt = await(bcrypt.genSalt(10));
    const hashpass = await bcrypt.hash(user.password , salt);
    user.password = hashpass;
  } catch (error) {
    throw error;
  }

});


const UserModel = db.model('User' , userSchema);
module.exports =UserModel;