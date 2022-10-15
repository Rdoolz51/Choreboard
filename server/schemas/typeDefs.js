const { gql } = require('apollo-server-express');

const typeDefs = gql`
    type User {
        _id: ID
        username: String
        email: String
        password: String
        childCount: Int
        children: [Child]
        choreList: [Chore]
        rewardList: [Reward]
    }
    
    type Child {
        _id: ID
        name: String
        points: Int
    }

    type Chore {
        _id: ID
        name: String
        description: String
        pointValue: Int
        completedBy: Child
    }

    type Reward {
        _id: ID
        name: String
        description: String
        cost: Int
        claimedBy: Child
    }
    
    type Auth {
        token: ID
        user: User
      }

    type Query {
        users: [User]
        me: User
        chore: [Chore]
        reward: [Reward]
    }

    type Mutation {
        addUser(username: String!, email: String!, password: String!): Auth
        login(email: String!, password: String!): Auth
        changePassword(currentPassword: String!, password: String!): Auth
        removeUser(_id: ID!): User
        addChore(name: String!, description: String, pointValue: Int!): Chore
        editChore(_id: ID!, completedBy: ID!): Chore
        removeChore(_id: ID!): Chore
        addReward(name: String!, description: String, cost: Int!) : Reward 
        claimReward(_id: ID!, claimedBy: ID!): Reward
        removeReward(_id: ID!): Reward
        addChild(name: String!, points: Int): Child
        removeChild(_id: ID!): Child
    }
    `;

module.exports = typeDefs;