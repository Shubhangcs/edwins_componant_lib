const UserService = require('../services/user_services');

exports.register = async (req , res , next)=>{
    try {
        const {name ,email , password} = req.body;
        const successRes = await UserService.registerUser(name , email , password);

        res.json({status:true , success:"user registration successfull"})
    } catch (error) {
        throw error;
    }
}
exports.login = async (req , res , next)=>{
    try {
        const {email , password} = req.body;
        const user = await UserService.checkuser(email);
        if(!user){
            throw new Error('user does not exist')
        }
        else{

        }
        const isMatch = await user.comparePassword(password);

        if(isMatch === false){
            throw new Error('password is invalid');
        }
        let tokenData = {_id:user._id , email:user.email};
        const token = await UserService.generateToken(tokenData , "secretKey" , '1h');
        res.status(200).json({status: true , token:token})

    } catch (error) {
        throw error;
    }
}