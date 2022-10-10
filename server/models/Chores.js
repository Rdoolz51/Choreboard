const { Schema, model } = require('mongoose');

const choreSchema = new Schema(
    {
        description: {
            type: String,
        },
        userId: {
            types: Schema.Types.ObjectId,
            ref: 'User'
        },
        choresList: {
            type: Schema.Types.ObjectId,
            ref: 'ChoresList'
        },
        isDeleted: {
            type: Boolean,
            default: false
        }
    }
);

const Chores = model('Chores', chorseList);
module.exports = Chores;