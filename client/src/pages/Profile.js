import React from "react";
import {Card, Button} from 'react-bootstrap';
import ChildList from '../components/ChildList';
import { useQuery, useMutation } from '@apollo/client';
import { ADD_CHILD } from "../utils/mutations";
import { Navigate, useParams } from "react-router-dom";
import { QUERY_ME, QUERY_USERS } from "../utils/queries";
import Auth from "../utils/auth";
import './Profile.css';


const Profile = () => {
    const [addChild] = useMutation(ADD_CHILD);
    const {username: userParam} = useParams();

    const { loading, data } = useQuery(userParam ? QUERY_USERS : QUERY_ME, {
        variables: { username: userParam}
    });

    const user = data?.me || data?.user || {};

    if (Auth.loggedIn() && Auth.getProfile().data.username === userParam) {
        return <Navigate to="/profile" />;
      }


    const handleClick = async () => {
        try {
          await addChild({
            variables: { id: user._id }
          });
        } catch (e) {
          console.error(e);
        }
      };

      {/* <h1> Here will be user profile data. Including: Username, email, list of children, how many points each child has, etc...</h1>
      <h2> Maybe have a "chores completed" counter. This can be done pretty easily I think. When we filted completedBy to show completed tasks, we just take the length and assign it to a variable</h2> */}
    return (
        <main>
            <div className="bgImg" />
                <div className="container">
                    <div className="mt-4">
                        <div>
                            <Button className="addChildBtn--profile">Add Child</Button>
                        </div>
                        <header><h1>My Profile</h1></header>
                        <div>
                            <div>
                                <h5>Username:</h5>
                            </div>
                            <div>
                                <h5>Email:</h5>
                            </div>
                            <div>
                                <h5>My Children</h5>
                            </div>
                        </div>
                    </div>
                </div>
            <div>
            </div>
            {/* <div>
                <ChildList 
                // username={user.username}
                // childCount={user.childCount}
                // children={user.children}
                />
            </div> */}
        </main>
    );
};

export default Profile;