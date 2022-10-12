const { Schema, model } = require('mongoose');
const bcrypt = require ('bcrypt');

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
    }, 
    {
        toJSON: {
            virtuals: true
        }
    }
);

//compare the incoming password with the hashed password
userSchema.methods.isCorrectPassword = async function(password) {
    return bcrypt.compare(password, this.password);
};

const User = model('User', userSchema);

module.exports= User; 