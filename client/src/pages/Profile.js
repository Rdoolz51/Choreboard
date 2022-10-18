import React from "react";
import Auth from "../utils/auth";
import ChoresList from "../components/ChoresList";
import RewardsList from "../components/RewardsList";


const Profile = () => {
    return (
        <main>
            {Auth.loggedIn() ? (
                <div>
                    <ChoresList />
                    <RewardsList />

                </div>
            ) : (<h1>Please Sign In</h1>)}
        </main>
    );
};

export default Profile;