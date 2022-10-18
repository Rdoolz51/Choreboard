import React from "react";
import { Link } from 'react-router-dom';
// import Auth from '../../utils/auth';

const Header = () => {

    return (
        <header>
            <div className="header">
                <nav>
                    <Link to="/" className="header-title">
                    <h1>Chore Board </h1>
                    </Link>
                    <>
                    <Link to="/signup" className="header-title">Sign up!</Link>

                    <Link to="/login" className="header-title">Login</Link>
                    </>
                </nav>
            </div>
        </header>
    )
}

export default Header;