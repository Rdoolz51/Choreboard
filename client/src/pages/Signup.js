import React, {useState} from "react";
import { useMutation } from '@apollo/client';
import {ADD_USER} from "../utils/mutations";
import Auth from '../utils/auth';
import Button from "react-bootstrap/Button";
import Card from 'react-bootstrap/Card';

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
        <main className="card-style">
            <Card style={{ width: '18rem', backgroundColor: 'var(--teal)', inlineSize: '300px'}}>
                <Card.Header>
                    <h1 className="form-title"> Sign up!</h1>
                    <Card.Body>
                        <form onSubmit={handleFormSubmit}>
                            <input
                            className="form-input"
                            placeholder="username"
                            name="username"
                            type="username"
                            id="username"
                            value={formState.username}
                            onChange={handleChange}></input>
                            <hr></hr>
                            <input
                            className="form-input"
                            placeholder="email"
                            name="email"
                            type="email"
                            id="email"
                            value={formState.email}
                            onChange={handleChange}></input>
                            <hr></hr>
                            <input
                            className="form-input"
                            placeholder="password"
                            name="password"
                            type="password"
                            id="password"
                            value={formState.password}
                            onChange={handleChange}></input>
                            <hr></hr>
                            <Button>Lets Go!</Button>
                        </form>
                        {error && <div>Ooops! Signup failed</div>}
                    </Card.Body>
                </Card.Header>
            </Card>
        </main>
    )
}

export default Signup;