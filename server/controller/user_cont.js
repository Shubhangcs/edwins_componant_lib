const UserService = require('../services/user_services');
const UserModel=require("../models/user");


exports.register = async (req , res , next)=>{
    try {
        const {name ,email , password} = req.body;
        const successRes = await UserService.registerUser(name , email , password);

        res.json({status:true , success:"user registration successfull"});
    } catch (error) {
       res.json({status:false , success: "user registration failed"});
    }
}
exports.login = async (req , res , next)=>{
    try {
        const {email , password} = req.body;
        const user = await UserService.checkuser(email);
        if(!user){
            res.json({status:false , success: "login unsuccessfull"});
        }
        else{
            const isMatch = await UserService.checkpass(password,user.password);
            if(!isMatch){
                res.json({status:false , success: "login unsuccessfull"});
            }else{
                let tokenData = {_id:user._id , email:user.email};
                const token = await UserService.generateToken(tokenData , "secretKey" , '1h');
                res.status(200).json({status: true , token:token})
            }
 
        }
 } catch (error) {
                throw error;
    }
}