import React from "react";
import { Link } from 'react-router-dom';
import Auth from '../../utils/auth';
import '../Header/Header.css';

const Header = () => {

    const logout = event => {
        event.preventDefault();
        Auth.logout();
    };

    return (
        <header>
            <div className="header--header container-fluid">
                <Link to="/" className="title--header row">
                    <h1>Chore Board </h1>
                </Link>
                <nav>
                    {Auth.loggedIn() ? (
                        <div className="rightNav--header">

                            <a href="/chores" className="title--header">Chores</a>
                            <a href="/rewards" className="title--header">Rewards</a>
                            <a href="/profile" className="title--header">Profile</a>
                            <a href="/" className="title--header" onClick={logout}>
                                Logout
                            </a>
                        </div>
                    ) : (
                        <div className="rightNav--header">
                            <Link to="/signup" className="title--header">Sign up!</Link>
                            <Link to="/login" className="title--header login--header">Login</Link>
                        </div>
                    )}
                </nav>
            </div>
        </header>
    );
};

export default Header;