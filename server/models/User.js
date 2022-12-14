const { Schema, model } = require('mongoose');
const bcrypt = require('bcrypt');

const userSchema = new Schema(
    {
        username: {
            type: String,
            required: true,
            unique: true,
            trim: true
        },
        email: {
            type: String,
            required: true,
            unique: true,
            match: [/.+@.+\..+/, 'Must match an email address!']
        },
        password: {
            type: String,
            required: true,
            minLength: 5
        },
        children: [
            {
                type: Schema.Types.ObjectId,
                ref: 'Child'
            }
        ],
        choreList: [
            {
                type: Schema.Types.ObjectId,
                ref: 'Chore'
            }
        ],
        rewardList: [
            {
                type: Schema.Types.ObjectId,
                ref: 'Reward'
            }
        ]
    },
    {
        toJSON: {
            virtuals: true
        }
    }
);

userSchema.pre('save', async function (next) {
    if (this.isNew || this.isModified('password')) {
        const saltRounds = 10;
        this.password = await bcrypt.hash(this.password, saltRounds);
    }

    next();
});

//compare the incoming password with the hashed password
userSchema.methods.isCorrectPassword = async function (password) {
    return await bcrypt.compare(password, this.password);
};

userSchema.virtual('childCount').get(function () {
    return this.children.length;
});

const User = model('User', userSchema);

module.exports = User; 