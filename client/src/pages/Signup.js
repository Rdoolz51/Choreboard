import React, {useState} from "react";
import { useMutation } from '@apollo/client';
import {ADD_USER} from "../utils/mutations";
import Auth from '../utils/auth';

const Signup = () => {
    const [formState, setFormState] = useState({ username: '', email: '', password: ''})
    const [addUser, {error}] = useMutation(ADD_USER);

    const handleChange = (event) => {
        const {name, value} = event.target;

        setFormState({
            ...formState,
            [name]: value,
        });
    }

    const handleFormSubmit = async event => {
        event.preventDefault();

        try{
            const { data } = await addUser({
                variables: {...formState}
            });

            Auth.login(data.login.token);
        } catch(e) {
            console.error(e);
        }
    };

    return(
        <main>
            <div className="card">
                <div className="card-header">
                    <h1> Sign up!</h1>
                    <div className="card-body">
                        <form onSubmit={handleFormSubmit}>
                            <input
                            className="signup-input"
                            placeholder="Enter your username"
                            name="username"
                            type="username"
                            id="username"
                            value={formState.username}
                            onChange={handleChange}></input>
                            <input
                            className="signup-input"
                            placeholder="Enter your email"
                            name="email"
                            type="email"
                            id="email"
                            value={formState.username}
                            onChange={handleChange}></input>
                            <input
                            className="signup-input"
                            placeholder="*******"
                            name="password"
                            type="password"
                            id="password"
                            value={formState.username}
                            onChange={handleChange}></input>
                            <button>Enter</button>
                        </form>
                        {error && <div>Ooops! Signup failed</div>}
                    </div>
                </div>
            </div>
        </main>
    )
}

export default Signup;