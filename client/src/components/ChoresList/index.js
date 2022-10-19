import React, { useState } from "react";
// import { useMutation, useQuery } from '@apollo/client';
// import { ADD_CHORE, EDIT_CHORE, REMOVE_CHORE } from '../../utils/mutations';
import { Modal, Button, Form } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.css';
import './ChoresList.css';

const ChoresList = () => {
    const [show, setShow] = useState(false);

    const handleClose = () => setShow(false);
    // const handleSubmit = () => {
    //     if()
    // }
    const handleShow = () => setShow(true);

    // const { loading, error, data } = useQuery(QUERY_MYCHORES);
    // if (loading) return 'Loading...';
    // if (error) return `Error! ${error.message}`;
    return (
    <>
        <div className="container">

            <div className=" choreBoard">
                <div className="choreBoardHeader">
                    <h1 className="mt-2">My Chore Board</h1>
                    <Button variant="primary" onClick={handleShow}>
                        + Add Chore
                    </Button>
                </div>

            </div>

        </div>
            <Modal show={show} onHide={handleClose} className="addChoreModal">
                <Modal.Header closeButton>
                    <Modal.Title>New Chore</Modal.Title>
                </Modal.Header>
                <Modal.Body>
                    <Form>
                        <Form.Group className="mb-3" controlId="ChoreForm.ControlInput1">
                            <Form.Label>Chore Name:</Form.Label>
                            <Form.Control
                                type="text"
                                name="choreName"
                                placeholder="Enter Chore Here"
                                required
                                autoFocus
                                />
                        </Form.Group>
                        <Form.Group
                            className="mb-3"
                            controlId="ChoreForm.ControlTextarea1"
                            >
                            <Form.Label>Chore Description:</Form.Label>
                            <Form.Control as="textarea" name="choreDesc" rows={3} placeholder="Briefly Describe The Specifics Of The Chore" />
                        </Form.Group>
                        <Form.Group
                            className="mb-3"
                            controlId="ChoreForm.ControlTextarea2"
                            >
                            <Form.Label>Point Value:</Form.Label>
                            <Form.Control className="text-secondary" name="chorePoints" style={{ width: 75 }} type="number" step="5" min="5" placeholder="5" required max="50"></Form.Control>

                        </Form.Group>
                    </Form>
                    
                </Modal.Body>
                <Modal.Footer>
                    <Button variant="danger" onClick={handleClose}>
                        Cancel
                    </Button>
                    <Button type="submit" variant="success" onClick={handleClose}>
                        Add Chore
                    </Button>
                </Modal.Footer>
            </Modal>
    </>
    );
};

export default ChoresList;