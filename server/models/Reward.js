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
        },
        claimedBy: {
            type: Schema.Types.ObjectId,
            ref: "Child"
        }
    }
);

const Reward = model("Reward", rewardSchema);

module.exports = Reward;