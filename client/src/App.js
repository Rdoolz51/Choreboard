import {ApolloProvider, ApolloClient, InMemoryCache, createHttpLink} from '@apollo/client';
import { setContext } from '@apollo/client/link/context';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import React from 'react';
import Footer from './components/Footer';
import Header from './components/Header';
import './App.css';

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
                {/* <Route 
                path="/" 
                element={<Home />}>
                </Route> */}
              </Routes>
            </div>
          <Footer />    
        </div>
      </Router>
    </ApolloProvider>
  );
}

export default App;
