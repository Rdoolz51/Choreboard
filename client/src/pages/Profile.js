import React, { useState } from "react";
import { Form, Modal, Button, Card, ListGroup, Table } from "react-bootstrap";
import { useQuery, useMutation, gql } from "@apollo/client";
import { ADD_CHILD } from "../utils/mutations";
import "./Profile.css";

const Profile = () => {
  const [show, setShow] = useState(false);
  const [childName, setChildName] = useState(" ");
  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);

  const [addChild] = useMutation(ADD_CHILD);
  const { data, error, refetch } = useQuery(gql`
  query Me {
      me {
        username
        email
        children {
          _id
          name
          points
        }
      }
    }
  `, {
    fetchPolicy: "network-only"
  });

  const user = data?.me || data?.user || {};

  //   if (Auth.loggedIn() && Auth.getProfile().data.username === userParam) {
  //     return <Navigate to="/profile" />;
  //   }

  const handleSubmit = async (event) => {
    event.preventDefault();
    try {
      await addChild({
        // whats the point of the id here? (Removed it)
        variables: { name: childName, points: 0 }
      });
      await refetch();
      setShow(false);
      setChildName("");
    } catch (e) {
      console.error(e);
    }
  };

  return (
    <>
      <Modal show={show} onHide={handleClose} style={{ marginTop: "5rem" }}>
        <Form onSubmit={handleSubmit}>
          <Modal.Header closeButton>
            <Modal.Title>Add Child</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <Form.Group className="mb-3" controlId="exampleForm.ControlInput1">
              <Form.Label>Childs Name:</Form.Label>
              <Form.Control type="text" autoFocus value={childName} onChange={(e) => setChildName(e.target.value.trim())} />
            </Form.Group>
          </Modal.Body>
          <Modal.Footer>
            <Button variant="danger" onClick={handleClose}>
              Cancel
            </Button>
            <Button variant="success" type="submit">
              Save Child
            </Button>
          </Modal.Footer>
        </Form>
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
                <h5>Username: {data && data.me.username} </h5>
              </ListGroup.Item>
              <ListGroup.Item>
                <h5>Email: {data && data.me.email} </h5>
              </ListGroup.Item>
            </ListGroup>
          </Card.Body>
        </Card>

        <Card className="mt-4 table--profile"
          style={{ backgroundColor: "var(--lightGrey)" }}>
          <Card.Body>
            <Table hover>
              <thead>
                <tr>
                  <th>Child Name:</th>
                  <th>Points:</th>
                </tr>
              </thead>
              <tbody>
                {data && data.me.children.length > 0 ? data.me.children.map(kid => {
                  return (
                    <tr key={kid._id}>
                      <td>{kid.name}</td>
                      <td>{kid.points}</td>
                    </tr>
                  );
                }) : (
                  <tr key="No children">
                    <td colSpan={2}>Amber Alert</td>
                  </tr>
                )}
              </tbody>
            </Table>
          </Card.Body>
        </Card>
      </div>
    </>
  );
};

export default Profile;
