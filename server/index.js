const express = require('express');
const path = require('path');

//import ApolloServer
const { ApolloServer } = require('apollo-server-express');

//import for middleware function
const { authMiddleware } = require('./utils/auth');

//import to typeDefs and resolvers
const { typeDefs, resolvers } = require('./schemas');
const db = require('./config/connection');


const app = express();
const PORT = process.env.PORT || 3001;

app.use(express.urlencoded({extended: false}));
app.use(express.json());

db.once('open', () => {
    app.listen(PORT, () => {
        console.log(`API running on port ${PORT}`);
    })
})


