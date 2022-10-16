const { AuthenticationError } = require("apollo-server-express");
const { User, Chore, Reward, Child } = require("../models");
const { signToken } = require("../utils/auth");

const resolvers = {
  Query: {
    //Query to get all users
    users: async () => {
      const user = await User.find().populate("children").populate('choreList').populate('rewardList')
        .select("-__v -password");

      await Promise.all(user.map(async (user) => {
        await Promise.all(user.choreList.map(async (chore) => {
          await chore.populate('completedBy');
        }));
      }));

      await Promise.all(user.map(async (user) => {
        await Promise.all(user.rewardList.map(async (reward) => {
          await reward.populate('claimedBy');
        }));
      }));

      return user;
    },

    //Query to get a single user by username
    me: async (parent, args, context) => {
      if (context.user) {

        const user = await User.findOne({ _id: context.user._id })
          .select("-__v -password")
          .populate("children").populate('choreList').populate('rewardList');

        await Promise.all(user.choreList.map(async (chore) => {
          await chore.populate('completedBy');
        }));

        await Promise.all(user.rewardList.map(async (reward) => {
          await reward.populate('claimedBy');
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
    //find all chores by logged in user
    myChores: async (parent, args, context) => {
      if (context.user) {
        const user = await User.findById({ _id: context.user._id }).populate('choreList').populate('children');
        console.log(user);
        await Promise.all(user.choreList.map(async (chore) => {
          await chore.populate('completedBy');
        }));
        return user;

      } else {
        throw new AuthenticationError("Not Logged In");
      }
    },

    //find all rewards 
    reward: async () => {
      return await Reward.find();
    },

    myRewards: async (parent, args, context) => {
      if (context.user) {
        const user = await User.findById({ _id: context.user._id }).populate('rewardList').populate('children');
        console.log(user);
        await Promise.all(user.rewardList.map(async (reward) => {
          await reward.populate('claimedBy');
        }));
        return user;

      } else {
        throw new AuthenticationError("Not Logged In");
      }
    },
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

    removeUser: async (parent, { _id }, context) => {
      await User.findByIdAndDelete({ _id });
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
    editChore: async (parent, { _id, completedBy }, context) => {
      if (context.user) {
        const user = await User.findOne({ _id: context.user._id }).populate('choreList');
        for (let i = 0; i < user.choreList.length; i++) {
          if (_id === user.choreList[i]._id.toString()) {
            const chore = await Chore.findByIdAndUpdate(
              { _id: _id },
              { completedBy },
              { new: true }
            );
            await Child.findByIdAndUpdate({ _id: completedBy }, { $inc: { 'points': user.choreList[i].pointValue } });


            return chore;
          }
        }
      } else {
        throw new AuthenticationError("Not Logged In");
      }
    },
    removeChore: async (parent, { _id }, context) => {
      if (context.user) {
        const user = await User.findOne({ _id: context.user._id });
        for (let i = 0; i < user.choreList.length; i++) {
          if (_id === user.choreList[i].toString()) {
            const chore = await Chore.findOneAndDelete(
              { _id: _id }
            );
          }
        }
      } else {
        throw new AuthenticationError("Not Logged In");
      }
    },
    addReward: async (parent, args, context) => {
      if (context.user) {
        const reward = await Reward.create({ ...args });
        const updatedUser = await User.findByIdAndUpdate(
          { _id: context.user._id },
          { $addToSet: { rewardList: reward._id } },
          { new: true }
        ).populate('rewardList');
        return updatedUser;

      } else {
        throw new AuthenticationError("Not Logged In");
      }
    },

    claimReward: async (parent, { _id, claimedBy }, context) => {
      if (context.user) {
        const user = await User.findOne({ _id: context.user._id }).populate('rewardList');
        for (let i = 0; i < user.rewardList.length; i++) {
          if (_id === user.rewardList[i]._id.toString()) {
            const reward = await Reward.findByIdAndUpdate(
              { _id: _id },
              { claimedBy },
              { new: true }
            );
            await Child.findByIdAndUpdate({ _id: claimedBy }, { $inc: { 'points': (user.rewardList[i].cost * -1) } });
            return reward;
          }
        }
      } else {
        throw new AuthenticationError("Not Logged In");
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
    },
    removeChild: async (parent, { _id }, context) => {
      if (context.user) {
        const user = await User.findOne({ _id: context.user._id });
        for (let i = 0; i < user.children.length; i++) {
          if (_id === user.children[i].toString()) {
            const child = await Child.findOneAndDelete(
              { _id: _id }
            );
            return child;
          }
        }
      } else {
        throw new AuthenticationError("Not Logged In");
      }
    }
  },
};

module.exports = resolvers;
