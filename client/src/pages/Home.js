import React from 'react';
import ChoresList from '../components/ChoresList';
import RewardsList from '../components/RewardsList';
import Auth from '../utils/auth';

const Home = () => {
    return (
        <main>
            {Auth.loggedIn() ? (
                <>
                    <ChoresList />
                    <RewardsList />
                </>
            ) : (<h1>Please Sign In</h1>)}
        </main>
    );
};

export default Home;