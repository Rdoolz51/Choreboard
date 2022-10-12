const { AuthenticationError } = require("apollo-server-express");
const { User, Child, Chore, Reward } = require('../models');

const resolvers = {
    Query: {
        user: async () => {
            return user.findOne({ username });

        }
    }
};

module.exports = resolvers;