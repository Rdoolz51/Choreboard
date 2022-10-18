import React from "react";
import Auth from "../utils/auth";


const Profile = () => {
    return (
        <main>
            {Auth.loggedIn() ? (
                <div>
                    <h1> Thank you for signing in!</h1>

                </div>
            ) : (<h1>Please Sign In</h1>)}
        </main>
    );
};

export default Profile;