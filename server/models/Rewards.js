const { Schema, model } = require('mongoose');

const rewardSchema = new Schema(
    {
        rewardDescription: {
            type: Schema.Types.ObjectId,
            ref: "RewardDes"
        },
        childId: { //TODO: pt2
            type: Schema.Types.ObjectId,
            ref: "Children"
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

const Rewards = model("Rewards", rewardSchema);

module.export = Rewards;