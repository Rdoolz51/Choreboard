const { AuthenticationError } = require("apollo-server-express");
const { User, Chore, Reward, Child } = require("../models");
const { signToken } = require("../utils/auth");

const resolvers = {
  Query: {
    //Query to get all users
    users: async () => {
      const display = await User.find().populate("children").populate('choreList')
        .select("-__v -password");

      await Promise.all(display.map(async (user) => {
        await Promise.all(user.choreList.map(async (chore) => {
          await chore.populate('completedBy');
        }));
      }));

      return display;
    },

    //Query to get a single user by username
    me: async (parent, args, context) => {
      if (context.user) {

        const user = await User.findOne({ _id: context.user._id })
          .select("-__v -password")
          .populate("children").populate('choreList');
        console.log(user);

        await Promise.all(user.choreList.map(async (chore) => {
          await chore.populate('completedBy');
        }));

        return user;
      } else {
        throw new AuthenticationError("Not Logged In");
      }

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

    changePassword: async (parent, args, context) => {
      if (context.user) {
        const user = await User.findOne({ _id: context.user._id });
        const correctCurrPw = await user.isCorrectPassword(args.currentPassword);

        if (correctCurrPw) {

          user.password = args.password;
          await user.save();
          const token = signToken(user);
          return { token };
        }
        else {
          throw new AuthenticationError("Incorrect Password");
        }
      }
      throw new AuthenticationError("Not logged in");
    },

    login: async (parent, { email, password }) => {
      const user = await User.findOne({ email });

      if (!user) {
        throw new AuthenticationError("Incorrect username");
      }
      const correctPw = await user.isCorrectPassword(password);
      if (!correctPw) {
        throw new AuthenticationError("Incorrect password");
      }
      const token = signToken(user);
      return { token, user };
    },
    //addChore
    addChore: async (parent, args, context) => {
      if (context.user) {
        const chore = await Chore.create({ ...args });
        const updatedUser = await User.findByIdAndUpdate(
          { _id: context.user._id },
          { $addToSet: { choreList: chore._id } },
          { new: true }
        ).populate('choreList');


        await Promise.all(updatedUser.choreList.map(async (chore) => {
          await chore.populate('completedBy');
        }));

        return updatedUser;


      }
      else {
        throw new AuthenticationError("Not Logged In");
      }
    },
    // edit
    editChore: async (parent, { _id, completedBy }, context) => {
      if (context.user) {
        const user = await User.findOne({ _id: context.user._id });
        console.log(_id);
        for (let i = 0; i < user.choreList.length; i++) {
          if (_id === user.choreList[i].toString()) {
            const chore = await Chore.findByIdAndUpdate(
              { _id: _id },
              { completedBy },
              { new: true }
            );
          }

        }

      } else {
        throw new AuthenticationError("Not Logged In");
      }
    },
    //     removeChore
    //     await User.findByIdAndDelete(
    //       { _id: context.user._id },
    //       { $pull: { chore: chore._id } },
    //       { new: false }
    //     );
    //     return chore;
    //   }
    // },
    //addReward - load user, check if the reward id belongs to user(like chore), check if child is user's(like chore), load child, load reward, updateChild(deduct points)
    //WHEN I MAKE A DATABASE CALL, AWAIT IT. 
    addReward: async (parent, args, context) => {
      if (context.user) {
        const reward = await Reward.create({
          ...args,
          username: context.user.username,
        });

        //removeReward
        await User.findByIdAndDelete(
          { _id: context.user._id },
          { $pull: { reward: reward._id } },
          { new: false }
        );
        return reward;
      }
    },
    //addChild
    addChild: async (parent, args, context) => {
      if (context.user) {
        const child = await Child.create({ ...args });
        const updatedUser = await User.findByIdAndUpdate(
          { _id: context.user._id },
          { $addToSet: { children: child._id } },
          { new: true }
        ).populate("children");
        return child;
      }
    }
  },
};
module.exports = resolvers;
