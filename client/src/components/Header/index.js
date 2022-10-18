import React from "react";
import { Link } from 'react-router-dom';
import Auth from '../../utils/auth';

const Header = () => {

    const logout = event => {
        event.preventDefault();
        Auth.logout();
    };

    return (
        <header>
            <div className="header container-fluid">
                <Link to="/profile" className="header-title row">
                    <h1>Chore Board </h1>
                </Link>
                <nav>
                    {Auth.loggedIn() ? (
                        <div className="rightNav">
                            <a href="/" className="header-title" onClick={logout}>
                                Logout
                            </a>
                        </div>
                    ) : (
                        <div className="rightNav">
                            <Link to="/signup" className="header-title">Sign up!</Link>
                            <Link to="/login" className="header-title">Login</Link>
                        </div>
                    )}
                </nav>
            </div>
        </header>
    );
};

export default Header;