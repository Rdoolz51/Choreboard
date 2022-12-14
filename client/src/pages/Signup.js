import React, { useState } from "react";
import { useMutation } from '@apollo/client';
import { ADD_USER } from "../utils/mutations";
import Auth from '../utils/auth';
import Button from "react-bootstrap/Button";
import Card from 'react-bootstrap/Card';
import './Signup.css';

const Signup = () => {
    const [formState, setFormState] = useState({ username: '', email: '', password: '' });
    const [addUser, { error }] = useMutation(ADD_USER);

    const handleChange = (event) => {
        const { name, value } = event.target;

        setFormState({
            ...formState,
            [name]: value,
        });
    };

    const handleFormSubmit = async event => {
        event.preventDefault();

        try {
            const { data } = await addUser({
                variables: { ...formState }
            });

            Auth.login(data.addUser.token);
        } catch (e) {
            console.error(e);
        }
    };

    return (
        <main className="card-style--signup">
            <div className="bgImg" />
            <Card style={{ width: '18rem', backgroundColor: 'var(--yellow)', inlineSize: '300px' }}>
                <Card.Header>
                    <h1 className="form-title--signup"> Sign up Information</h1>
                    <Card.Body>
                        <form onSubmit={handleFormSubmit}>
                            <input
                                className="form-input--signup"
                                placeholder="username"
                                name="username"
                                type="text"
                                id="username"
                                value={formState.username}
                                onChange={handleChange}></input>
                            <hr></hr>
                            <input
                                className="form-input--signup"
                                placeholder="email"
                                name="email"
                                type="email"
                                id="email"
                                value={formState.email}
                                onChange={handleChange}></input>
                            <hr></hr>
                            <input
                                className="form-input--signup"
                                placeholder="password"
                                name="password"
                                type="password"
                                id="password"
                                value={formState.password}
                                onChange={handleChange}></input>
                            <hr></hr>
                            <Button type="submit">Lets Go!</Button>
                        </form>
                        {error && <div>Ooops! Signup failed</div>}
                    </Card.Body>
                </Card.Header>
            </Card>
        </main>
    );
};

export default Signup;