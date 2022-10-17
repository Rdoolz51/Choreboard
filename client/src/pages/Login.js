import React, { useState } from 'react';
import { useMutation } from '@apollo/client';
import { LOGIN_USER } from '../utils/mutations';
import Auth from '../utils/auth';

const Login = () => {
    const [formState, setFormState] = useState({ email: '', password: ''})
    const [login, {error}] = useMutation(LOGIN_USER);

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
            const { data } = await login({
                variables: {...formState}
            });

            Auth.login(data.login.token);
        } catch(e) {
            console.error(e);
        }
    };

    return(
        <main>
            <div>
                <div>
                    <h4>Login</h4>
                    <div>
                        <form onSubmit={handleFormSubmit}>
                        <input
                            className="login-input"
                            placeholder="Enter your username"
                            name="email"
                            type="email"
                            id="email"
                            value={formState.email}
                            onChange={handleChange}></input>
                            <input
                            className="login-input"
                            placeholder="Enter your email"
                            name="password"
                            type="password"
                            id="password"
                            value={formState.password}
                            onChange={handleChange}></input>
                        </form>
                        {error && <div>Ooops! Login failed</div>}
                    </div>
                </div>
            </div>
        </main>
    )
}

export default Login;