const { Schema, model } = require('mongoose');

const rewardSchema = new Schema(
    {   
        name: {
            type: String,
            required: true
        },
        description: {
            type: String
        },
        cost: {
            type: Number,
            required: true
        }
    }
);

const Reward = model("Reward", rewardSchema);

module.exports = Reward;