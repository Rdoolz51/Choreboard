const { gql } = require('apollo-server-express');

const typeDefs = gql`
    type User {
        _id: ID!
        username: STRING!
        email: STRING!
        password: STRING!
        children: [Child]
    }
    
    type Child {
        _id: ID!
        name: STRING!
        points: INT!
    }

    type Chore {
        _id: ID!
        name: STRING!
        description: STRING
        pointValue: INT!
        completedBy: Child
    }

    type Reward {
        _id: ID!
        name: STRING!
        description: STRING
        cost: INT!
    }
    
    type Auth {
        token: ID!
        user: User
      }

    type Query {
        user(username: STRING): User
        chores(name: STRING): [Chore]
        rewards(name: STRING): [Reward]
    }

    type Mutation {
        register(email: STRING!, password: STRING!): User
        login(email: STRING!, password: STRING!): Auth
        editUser(password: STRING!): User
        addChore(name: STRING!, description: STRING, pointValue: INT!, completedBy: Child): Chore
        editChore(_id: ID!, completedBy: Child!): Chore
        removeChore(_id: ID!): Chore
        addReward(name: STRING!, description: STRING, cost: INT!) : Reward
        removeReward(_id: ID!): Reward
    }
`;

module.exports = typeDefs;