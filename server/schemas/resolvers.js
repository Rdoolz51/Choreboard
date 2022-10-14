const { AuthenticationError } = require("apollo-server-express");
const { User, Chore, Reward } = require("../models");
const { signToken } = require("../utils/auth");

const resolvers = {
  Query: {
    //Query to get all users
    users: async () => {
      return User.find().select("-__v -password").populate("Child");
    },

    //Query to get a single user by username
    user: async (parent, { username }) => {
      return User.findOne({ username })
        .select("-__v -password")
        .populate("Child");
    },

    //find all chores
    chore: async () => {
        return await Chore.find();
    },

    //find all rewards 
    reward: async () => {
        return await Reward.find();
    }
  },
  Mutation: {
    addUser: async (parent, args) => {
      const user = await User.create(args);
      const token = signToken(user);
      return { token, user };
    },

    editUser: async (parent, args, context) => {
      if (context.user) {
        return await User.findByIdAndUpdate(context.user._id, args, {
          new: true,
        });
      }
      throw new AuthenticationError("Not logged in");
    },

    login: async (parent, { email, password }) => {
      const user = await User.findOne({ email });

      if (!user) {
        throw new AuthenticationError("Incorrect credentials");
      }
      const correctPw = await user.isCorrectPassword(password);
      if (!correctPw) {
        throw new AuthenticationError("Incorrect credentials");
      }
      const token = signToken(user);
      return { token, user };
    },
    //addChore
    addChore: async (parent, args, context) => {
      if(context.user){
        const chore = await Chore.create({
          ...args,
          username: context.user.username,
        });
        
        //removeChore
        await User.findByIdAndDelete(
            {_id: context.user._id},
            { $pull: { chore: chore._id}},
            {new: false}
          )
        return chore;
      }
    },
    //addReward
    addReward: async (parent, args, context) => {
      if(context.user){
        const reward = await Reward.create({
          ...args,
          username: context.user.username,
        });

        //removeReward
        await User.findByIdAndDelete(
          { _id: context.user._id},
          { $pull: { reward: reward._id}},
          { new: false}
        )
        return reward;
      }
    }
  },
};

module.exports = resolvers;
