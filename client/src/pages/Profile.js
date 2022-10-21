import React, { useState } from "react";
import { Form, Modal, Button, Card, ListGroup } from "react-bootstrap";
import { useQuery, useMutation } from "@apollo/client";
import { ADD_CHILD } from "../utils/mutations";
import { Navigate, useParams } from "react-router-dom";
import { QUERY_ME, QUERY_USERS } from "../utils/queries";
import Auth from "../utils/auth";
import "./Profile.css";

const Profile = () => {
  const [show, setShow] = useState(false);

  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);

  const [addChild] = useMutation(ADD_CHILD);
  const { username: userParam } = useParams();

  const { loading, data } = useQuery(userParam ? QUERY_USERS : QUERY_ME, {
    variables: { username: userParam },
  });

  const user = data?.me || data?.user || {};

  if (Auth.loggedIn() && Auth.getProfile().data.username === userParam) {
    return <Navigate to="/profile" />;
  }

  const handleClick = async () => {
    try {
      await addChild({
        variables: { id: user._id },
      });
    } catch (e) {
      console.error(e);
    }
  };

  return (
    <>
      <Modal show={show} onHide={handleClose} style={{ marginTop: "5rem" }}>
        <Modal.Header closeButton>
          <Modal.Title>Add Child</Modal.Title>
        </Modal.Header>
        <Modal.Body>
          <Form>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Label>Childs Name:</Form.Label>
              <Form.Control type="email" autoFocus />
            </Form.Group>
          </Form>
        </Modal.Body>
        <Modal.Footer>
          <Button variant="danger" onClick={handleClose}>
            Cancel
          </Button>
          <Button variant="success" onClick={handleClose}>
            Save Child
          </Button>
        </Modal.Footer>
      </Modal>

      <div className="bgImg" />
      <div className="container container--profile" style={{ width: "45rem" }}>
        <Card
          className="mt-4 card--profile"
          style={{ backgroundColor: "var(--yellow)" }}
        >
          <Card.Title>
            <h1>My Profile</h1>
          </Card.Title>
          <Button
            className="addChildBtn--profile"
            style={{ fontFamily: "var(--font)" }}
            onClick={handleShow}
          >
            + Add Child
          </Button>
          <Card.Body className="card-body--profile">
            <ListGroup>
              <ListGroup.Item>
                <h5>Username: </h5>
              </ListGroup.Item>
              <ListGroup.Item>
                <h5>Email: </h5>
              </ListGroup.Item>
              <ListGroup.Item>
                <h5>Password:</h5>
              </ListGroup.Item>
            </ListGroup>
          </Card.Body>
        </Card>

        <Card className="mt-4 card--profile">
          <Card.Body>
            <ListGroup>
              <ListGroup.Item>
                <h5>Child:</h5>
                <h5>Total Points:</h5>
              </ListGroup.Item>
            </ListGroup>
          </Card.Body>
        </Card>
      </div>
    </>
  );
};

export default Profile;
