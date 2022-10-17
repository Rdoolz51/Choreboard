import React from "react";
import { Link } from 'react-router-dom';
import Auth from '../../utils/auth';

const Header = () => {

    return (
        <header>
            <div className="header">
                <Link to="/" className="header-title">
                    <h1>Chore Board </h1>
                </Link>
                <nav>
                </nav>
            </div>
        </header>
    )
}

export default Header;