const express = require('express');
const User = require('../models/user');

const authRouter = express.Router();


authRouter.post('/api/signup' ,async (req , res)=>{
    const {name  , phone,borrow} = req.body;

   const existingUser = await User.findOne({phone});

   if(existingUser){
        return res.status(400).json({msg:'The phone number already exist'})
   }

   let user = new User({
    name,
    phone,
    borrow,
   });

   user = await user.save();
   res.json(user);
});


module.exports = authRouter;