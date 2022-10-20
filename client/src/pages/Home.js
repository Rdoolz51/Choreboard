import React from "react";
import Auth from "../utils/auth";
import Card from "react-bootstrap/Card";
import homepic from "../assets/images/CleanModernBathroom.jpg";
import './Home.css';

const Home = () => {
    return (
        <main>
            <div className="bgImg" />

            {Auth.loggedIn() ? (
                <div className="card-style--home">
                    <Card
                        className="card--home"
                        style={{
                            width: "50rem",
                            backgroundColor: "var(--yellow)",
                            inlineSize: "1000px",
                        }}
                    >
                        <Card.Header className="card-header--home">
                            <h1 className="page-title--home">How to use this application</h1>
                            <ul className="page--home p-4">
                                <li>
                                    Navigate to your profile page
                                </li>
                                <li>
                                    Add your children's names to your profile
                                </li>
                                <li>
                                    Add a chore including a brief description and point value
                                </li>
                                <li>
                                    Add a reward including a brief description and cost value
                                </li>
                                <li>
                                    Once the chore is completed, check the "completed by" button to assign points to that child.
                                </li>
                                <li>
                                    Each child will accumalte points after completing chores to spend on a reward of choice.
                                </li>
                            </ul>
                        </Card.Header>
                    </Card>
                </div>
            ) : (
                <div className="card-style--home">
                    <Card
                        className="card--home"
                        style={{
                            width: "40rem",
                            backgroundColor: "var(--yellow)",
                            inlineSize: "700px" 
                        }}
                    >
                        <Card.Header className="card-header--home">
                            <h1 className="page-title--home">Welcome to ChoreBoard!</h1>
                            <img
                                src={homepic}
                                className="pic--home"
                                alt="clean bathroom"
                            ></img>

                            <p className="page--home">
                                Welcome to the Chore Board application where we make it fun and rewarding for both parents and children. As the user you will assign household chores to be completed and create rewards for your children. Your children will then be able to purchase the rewards with the points they have accumulated from doing chores!
                            </p>
                        </Card.Header>
                    </Card>
                </div>
            )}
        </main>
    );
};

export default Home;
