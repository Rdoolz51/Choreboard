const { Schema, model } = require('mongoose');

const rewardDescription = new Schema(
    {
        desciption: {
            type: String, 
            required: true
        },
        value: {
            type: String
        },
        userId: {
            type: Schema.Types.ObjectId,
            ref: "User"
        },
        isDeleted: {
            type: Boolean,
            default: false
        }
    }
);

const RewardDes = model("RewardDes", rewardDescription);

module.exports = RewardDes;