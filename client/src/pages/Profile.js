import React from "react";
import ChoresList from "../components/ChoresList";
import RewardsList from "../components/RewardsList";


const Profile = () => {
    return (
        <main>
            <div>
                <ChoresList />
                <RewardsList />

            </div>
        </main>
    );
};

export default Profile;