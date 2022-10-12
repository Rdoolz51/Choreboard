const { Schema, model } = require('mongoose');
const childSchema = require('./Child');

const choreSchema = new Schema(
    {   
        name: {
            type: String,
            required: true
        },
        description: {
            type: String,
        },
        pointValue: { 
            type: Number, 
            required: true
        },
        completedBy: [childSchema]
    }
);

const Chore = model('Chore', choreSchema);
module.exports = Chore;