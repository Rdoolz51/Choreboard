import React from "react";
import ChoresList from "../components/ChoresList";
import RewardsList from "../components/RewardsList";
import Auth from "../utils/auth";
import Card from "react-bootstrap/Card";
import homepic from "../assets/images/CleanModernBathroom.jpg";

const Home = () => {
  return (
    <main>
      {Auth.loggedIn() ? (
        <div>
          <h1> This will be a suggestion board</h1>
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
              <h1 className="header-title">Welcome to ChoreBoard</h1>
              <img
                src={homepic}
                className="home-pic"
                alt="clean bathroom"
              ></img>

              <p className="header-title">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
                eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
                enim ad minim veniam, quis nostrud exercitation ullamco laboris
                nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor
                in reprehenderit in voluptate velit esse cillum dolore eu fugiat
                nulla pariatur. Excepteur sint occaecat cupidatat non proident,
                sunt in culpa qui officia deserunt mollit anim id est laborum.
              </p>
            </Card.Header>
          </Card>
        </div>
      )}
    </main>
  );
};

export default Home;
