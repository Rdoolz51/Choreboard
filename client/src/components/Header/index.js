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
                <nav>
                    <Link to="/" className="header-title">
                        <h1>Chore Board </h1>
                    </Link>
                    {Auth.loggedIn() ? (
                        <>
                            <Link to="/profile" className="link-title">My Page</Link>
                            <a href="/" onClick={logout} className="link-title">Logout</a>
                        </>
                    ) : (
                        <>
                        <Link to="/signup" className="link-title">Sign up!</Link>
                        <Link to="/login" className="link-title">Login</Link>
                        </>
                    )}
                </nav>
            </div>
        </header>
    )
}

export default Header;