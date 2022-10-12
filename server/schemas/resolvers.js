const { AuthenticationError } = require("apollo-server-express");
const { User, Child, Chores, RewardDes } = require('../models');

const resolvers = {
    Query: {
        user: async () => {
            return User.findOne({ username });

        }
    }
};

module.exports = resolvers;