const mongoose = require('mongoose');
const db = require('../config/db');


const usercomponants = mongoose.Schema({
    name: {
        type: String,
        required: true
      },
      items: [
        {
          name: {
            type: String,
            required: true
          },
          image: {
            type: String,
            required: true
          },
          subtitle:{
            type: String,
            required: true
          }
        }

      ],
      time : { type : Date, default: Date.now }
});

const UserComponants = db.model('usercomp',usercomponants);
module.exports = UserComponants;