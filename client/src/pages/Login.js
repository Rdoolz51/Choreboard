import React, { useState } from 'react';
import { useMutation } from '@apollo/client';
import { LOGIN_USER } from '../utils/mutations';
import Auth from '../utils/auth';
import Button from "react-bootstrap/Button";
import Card from 'react-bootstrap/Card';
import './Login.css';

const Login = (props) => {
    const [formState, setFormState] = useState({ email: '', password: '' });
    const [login, { error }] = useMutation(LOGIN_USER);

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
            const { data } = await login({
                variables: { ...formState }
            });

            Auth.login(data.login.token);
        } catch (e) {
            console.error(e);
        }
    };

    return (
        <main className='card-style--login'>
            <div className="bgImg" />
            <Card style={{ width: '18rem', inlineSize: "300px", backgroundColor: 'var(--yellow)' }}>
                <Card.Header>
                    <h1 className="form-title--login">Login Information</h1>
                    <Card.Body>
                        <form onSubmit={handleFormSubmit} >
                            <input
                                className="form-input--login"
                                placeholder="email"
                                name="email"
                                type="email"
                                id="email"
                                value={formState.email}
                                onChange={handleChange}></input>
                            <hr></hr>
                            <input
                                className="form-input--login"
                                placeholder="password"
                                name="password"
                                type="password"
                                id="password"
                                value={formState.password}
                                onChange={handleChange}></input>
                            <hr></hr>
                            <Button type="submit">Log in</Button>
                        </form>
                        {error && <div>Ooops! Login failed</div>}
                    </Card.Body>
                </Card.Header>
            </Card>
        </main>
    );
};

export default Login;