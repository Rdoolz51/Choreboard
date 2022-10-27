const { Schema, model } = require('mongoose');

const childSchema = new Schema(
    {
        name: {
            type: String,
            required: true,
            length: 1
        },
        points: {
            type: Number,
            required: true
        }
    }
);

const Child = model('Child', childSchema);
module.exports = Child;