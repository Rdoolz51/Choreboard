const { Schema, model } = require('mongoose');

const childSchema = new Schema(
    {
        name: {
            type: String, 
            required: true
        },
        childId: {
            type: Schema.Types.ObjectId,
            ref: 'User'
        },
        isDeleted: {
            type: Boolean, 
            default: false
        }
    }
);

const Children = model('Children', childSchema);
module.exports = Children;