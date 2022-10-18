import React from "react";
import { Link } from 'react-router-dom';
import Auth from '../../utils/auth';

const Header = () => {

    const logout = event => {
        event.preventDefault();
        Auth.logout();
    }

    return (
        <header>
            <div className="header">
                <Link to="/" className="header-title">
                    <h1>Chore Board </h1>
                </Link>
                <nav>
                    {Auth.loggedIn() ? (
                        <>
                        <Link to="/profile">My Page</Link>
                        <a href="/" onClick={logout}>
                            Logout
                        </a>
                        </>
                    ) : (
                        <>
                        <Link to="/signup" className="header-title">Sign up!</Link>
                        <Link to="/login" className="header-title">Login</Link>
                        </>
                    )};
                </nav>
            </div>
        </header>
    )
}

export default Header;