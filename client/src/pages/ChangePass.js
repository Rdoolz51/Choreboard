import React, { useState } from 'react';
import { useMutation } from '@apollo/client';
import { CHANGE_PASSWORD} from '../utils/mutations';
import Button from "react-bootstrap/Button";
import Card from 'react-bootstrap/Card';
import './ChangePass.css';

const defaultForm = {currentPassword: "", password: ""}

const ChangePass = (props) => {
    const [message, setMessage] = useState(" ");
    const [formState, setFormState] = useState(defaultForm);
    const [changePassword, { error }] = useMutation(CHANGE_PASSWORD);

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
            const { data } = await changePassword({
                variables: { ...formState }
            });
            setFormState({...defaultForm});
            setMessage("Password Changed")
            
        } catch (e) {
            console.error(e);
            setMessage("Password Incorrect")
        }
    };

    return (
        <main className='card-style--changePass'>
            <div className="bgImg" />
            <Card style={{ width: '18rem', inlineSize: "300px", backgroundColor: 'var(--yellow)' }}>
                <Card.Header>
                    <h1 className="form-title--changePass">Change Password</h1>
                    <Card.Body>
                        <form onSubmit={handleFormSubmit} >
                            <input
                                className="form-input--changePass"
                                placeholder="Current Password"
                                name="currentPassword"
                                type="text"
                                id="currentPassword"
                                value={formState.currentPassword}
                                onChange={handleChange}></input>
                            <hr></hr>
                            <input
                                className="form-input--changePass"
                                placeholder="New Password"
                                name="password"
                                type="password"
                                id="password"
                                value={formState.password}
                                onChange={handleChange}></input>
                            <hr></hr>
                            <Button type="submit">Change Password</Button>
                        </form>
                        {error ? <div style={{color: "red", fontWeight: "bold"}}>{message}</div> : <div style={{color: "green", fontWeight: "bold"}}>{message}</div>}
                    </Card.Body>
                </Card.Header>
            </Card>
        </main>
    );
};

export default ChangePass;