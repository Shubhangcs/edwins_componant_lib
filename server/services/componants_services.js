const CompModel = require('../models/componants');


class ComponantModel{
    static async getComponant(){
        const data = await CompModel.findOne({});
        return data;
    }
}