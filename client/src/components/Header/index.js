import React from "react";
import { Link } from 'react-router-dom';
import Auth from '../../utils/auth';
import { NavDropdown } from 'react-bootstrap';

const Header = () => {

    const logout = event => {
        event.preventDefault();
        Auth.logout();
    };

    return (
        <header>
            <div className="header container-fluid">
                <Link to="/" className="header-title row">
                    <h1>Chore Board </h1>
                </Link>
                <nav>
                    {Auth.loggedIn() ? (
                        <div className="rightNav">

                            <a href="/chores" className="header-title">Chores</a>
                            <a href="/rewards" className="header-title">Rewards</a>
                            <a href="/profile" className="header-title">Profile</a>
                            <a href="/" className="header-title" onClick={logout}>
                                Logout
                            </a>
                        </div>
                    ) : (
                        <div className="rightNav">
                            <Link to="/signup" className="header-title signup">Sign up!</Link>
                            <Link to="/login" className="header-title login">Login</Link>
                        </div>
                    )}
                </nav>
            </div>
        </header>
    );
};

export default Header;