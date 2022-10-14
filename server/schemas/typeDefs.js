const { gql } = require('apollo-server-express');

const typeDefs = gql`
    type User {
        _id: ID
        username: String
        email: String
        password: String
        children: [Child]
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
    }
    
    type Auth {
        token: ID
        user: User
      }

    type Query {
        users: [User]
        user(username: String!): User
        chore: [Chore]
        reward: [Reward]
    }

    type Mutation {
        addUser(username: String!, email: String!, password: String!): User
        login(email: String!, password: String!): Auth
        editUser(password: String): User
        addChore(name: String!, description: String, pointValue: Int!): Chore
        editChore(_id: ID!, completedBy: ID!): Chore
        removeChore(_id: ID!): Chore
        addReward(name: String!, description: String, cost: Int!) : Reward
        removeReward(_id: ID!): Reward
    }
    `;
    
    module.exports = typeDefs;