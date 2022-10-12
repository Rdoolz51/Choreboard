const express = require('express');
const path = require('path');

//import ApolloServer
const { ApolloServer } = require('apollo-server-express');

//import for middleware function
const { authMiddleware } = require('./utils/auth');

//import to typeDefs and resolvers
const { typeDefs, resolvers } = require('./schemas');
const db = require('./config/connection');

//create a new Apollo server and pass in the schema data
const server = new ApolloServer({
    typeDefs,
    resolvers,
    context: authMiddleware
});

const app = express();
const PORT = process.env.PORT || 3001;

app.use(express.urlencoded({extended: false}));
app.use(express.json());

//Create a new instance of an Apollo server with the GraphQL schema
const startApolloServer = async (typeDefs, resolvers) => {
    await server.start();
    server.applyMiddleware({ app });

    db.once('open', () => {
        app.listen(PORT, () => {
            console.log(`API running on port ${PORT}`);
            console.log(`USe GraphQl at http://localhost:${PORT}${server.graphqlPath}`)
        })
    })
};

//call to async function start the server
startApolloServer(typeDefs, resolvers);


