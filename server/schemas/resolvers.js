const { AuthenticationError } = require("apollo-server-express");
const { User, Child, Chores, RewardDes } = require('../models');

const resolvers = {};

module.exports = resolvers