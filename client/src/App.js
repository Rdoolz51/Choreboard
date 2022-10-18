import {ApolloProvider, ApolloClient, InMemoryCache, createHttpLink} from '@apollo/client';
import { setContext } from '@apollo/client/link/context';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import React from 'react';
import Footer from './components/Footer';
import Header from './components/Header';
import Signup from './pages/Signup';
import Login from './pages/Login';
// import Profile from './pages/Profile';
import Home from './pages/Home';
// import './App.css';

const httpLink = createHttpLink({
  uri: '/graphql',
});

const authLink = setContext((_, { headers }) => {
  const token = localStorage.getItem('id_token');
  return {
    headers: {
      ...headers,
      authorization: token ? `Bearer ${token}` : '',
    },
  };
})

const client = new ApolloClient({
  // link: httpLink,
  link: authLink.concat(httpLink),
  cache: new InMemoryCache(),
});

function App () {
  return (
    <ApolloProvider client={client}>
      <Router>
        <div className="App">
          <Header />
            <div>
              <Routes>
                <Route 
                path="/" 
                element={<Home />}>
                </Route>

                <Route 
                path="/signup" 
                element={<Signup />}>
                </Route>

                <Route 
                path="/login" 
                element={<Login />}>
                </Route>

              </Routes>
            </div>
          <Footer />    
        </div>
      </Router>
    </ApolloProvider>
  );
}

export default App;
