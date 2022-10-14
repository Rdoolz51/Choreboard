import React from "react";
import { Link } from 'react-router-dom';
import Auth from '../../utils/auth';

const Header = () => {
    return (
        <header>
            <div>
                <Link to="/">
                    <h1> Chore Board </h1>
                </Link>
                <nav>
                    {Auth.loggedIn() ? (
                        <>
                        <Link to="/profile">My page</Link>
                        <a href="/" onClick={logout}>Logout</a>
                        </>
                    ) : (
                        <>
                        <Link to="/login">Login!</Link>
                        <Link to="signup">Sign up!</Link>
                        </>
                    )}
                </nav>
            </div>
        </header>
    )
}

export default Header;