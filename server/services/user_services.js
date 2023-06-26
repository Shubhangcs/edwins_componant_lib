const UserModel = require('../models/user');


class UserService{
    static async registerUser(email , password){
        try {
            const createuser = new UserModel({email , password});
            return await createuser.save();
        } catch (error) {
            throw error;
        }
    }
}

module.exports = UserService;