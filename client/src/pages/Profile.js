import React, { useState } from "react";
import { Form, Modal, Button, Card, ListGroup, Table } from "react-bootstrap";
import { useQuery, useMutation, gql } from "@apollo/client";
import { ADD_CHILD, REMOVE_CHILD } from "../utils/mutations";
import "./Profile.css";
import { FaTrashAlt, FaShoppingCart } from 'react-icons/fa';

const Profile = () => {
  const [show, setShow] = useState(false);
  const [childName, setChildName] = useState(" ");
  const handleClose = () => setShow(false);
  const handleShow = () => setShow(true);

  const [addChild] = useMutation(ADD_CHILD);
  const [deleteChild, { onCompleted }] = useMutation(REMOVE_CHILD);
  const { loading, data, error, refetch } = useQuery(gql`
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
  if (loading) return 'Loading...';
  if (error) return `Error! ${error.message}`;

  const handleSubmit = async (event) => {
    event.preventDefault();
    try {
      await addChild({
        variables: { name: childName, points: 0 }
      });
      await refetch();
      setShow(false);
      setChildName("");
    } catch (e) {
      console.error(e);
    }
  };

  const handleDeleteChild = async (childId) => {
    deleteChild({ variables: { id: childId } });
    onCompleted: refetch();
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
      <div className="container container--profile" style={{ width: "42rem" }}>
        <Card
          className="mt-4 card--profile"
          style={{ backgroundColor: "var(--yellow)" }}
        >
          <Card.Title>
            <h1>My Profile</h1>
          </Card.Title>
          <Card.Body className="card-body--profile">
            <ListGroup>
              <ListGroup.Item>
                <h5>Username: {data && data.me.username} </h5>
              </ListGroup.Item>
              <ListGroup.Item>
                <h5>Email: {data && data.me.email} </h5>
              </ListGroup.Item>
              <ListGroup.Item>
                <Button href="/ChangePass">Change Password</Button>
              </ListGroup.Item>
            </ListGroup>
          </Card.Body>
        </Card>

        <Card className="mt-4 table--profile"
          style={{ backgroundColor: "var(--yellow)" }}>
          <Card.Body>
            <Table hover>
              <thead>
                <tr>
                  <th>Child Name</th>
                  <th>Points</th>
                </tr>
              </thead>
              <tbody style={{ backgroundColor: "var(--lightGrey)" }}>
                {data && data.me.children.length > 0 ? data.me.children.map(kid => {
                  return (
                    <tr key={kid._id}>
                      <td>{kid.name}</td>
                      <td>{kid.points}</td>
                      <td>
                        <a href="/rewards" className="btn btn-light bg-transparent" data-toggle="tooltip" title="Rewards"><FaShoppingCart /></a>
                      </td>
                      <td><button className="btn btn-light bg-transparent" data-toggle="tooltip" title="Delete Child" onClick={() => handleDeleteChild(kid._id)}><FaTrashAlt /></button></td>
                    </tr>
                  );
                }) : (
                  <tr key="No children">
                    <td colSpan={2}>You have not added any children yet</td>
                  </tr>
                )}
              </tbody>
            </Table>
            <Button
              variant="primary"
              className="addChildBtn--profile"
              stlye={{ fontFamily: "var(--font)" }}
              onClick={handleShow}>Add A Child</Button>
          </Card.Body>
        </Card>
      </div>
    </>
  );
};

export default Profile;
