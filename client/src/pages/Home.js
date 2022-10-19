import React from "react";
import Auth from "../utils/auth";
import Card from "react-bootstrap/Card";
import homepic from "../assets/images/CleanModernBathroom.jpg";

const Home = () => {
    return (
        <main>
            {Auth.loggedIn() ? (
                <div className="card-style">
                    <Card
                        style={{
                            width: "50rem",
                            backgroundColor: "var(--yellow)",
                            inlineSize: "1000px",
                        }}
                    >
                        <Card.Header>
                            <h1 className="home-page-title">How to use this application</h1>
                            <ul className="home-page">
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
                <div className="card-style">
                    <Card
                        style={{
                            width: "40rem",
                            backgroundColor: "var(--yellow)",
                            inlineSize: "700px",
                        }}
                    >
                        <Card.Header>
                            <h1 className="home-page-title">Welcome to ChoreBoard!</h1>
                            <img
                                src={homepic}
                                className="home-pic"
                                alt="clean bathroom"
                            ></img>

                            <p className="home-page">
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
