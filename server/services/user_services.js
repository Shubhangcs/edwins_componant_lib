const UserModel = require('../models/user');
const bcrypt=require("bcrypt");
const jwt = require('jsonwebtoken');

class UserService{
    static async registerUser(name ,email , password){
        try {
            const createuser = new UserModel({name , email , password});
            return await createuser.save();

        } catch (error) {
            throw error;
        }
    }
    static async checkuser(email){
        try {
             const data=await UserModel.findOne({email})
            return (data==null)?false:data;
        } catch (error) {
           console.log(error);
        }
    }
    
    static async checkpass(userPass,hasedPass){
        try {
            const isMatch = await bcrypt.compare(userPass , hasedPass)
            return isMatch;
        } catch (error) {
           console.log(error);
        }
    }

    static async generateToken(tokenData , secretKey , jwt_expire){
        return jwt.sign(tokenData , secretKey ,{expiresIn: jwt_expire});
    }
}

module.exports = UserService;