const { Schema, model } = require('mongoose');

const choresListSchema = new Schema(
    {
        date: {
            type: Date,
            required: true
        },
        userId: {
            type: Schema.Types.ObjectId,
            ref: "User"
        },
        completedBy: {
            type: Schema.Types.ObjectId,
            ref: 'Child'
        },
        Chores: [{
            Chores: {
                type: Schema.Types.ObjectId,
                ref: "Chores"
            },
            completionStatus: {
                type: Boolean,
                default: false
            }
        }],
        completionStatus: {
            type: Boolean,
            default: false
        },
        reward: {
            type: Schema.Types.ObjectId,
            ref: "Rewards"
        },
        isDeleted: {
            type: Boolean,
            deault: false
        }
    }
);

const ChoresList = model('ChoresList', choresListSchema);

module.export = ChoresList;
