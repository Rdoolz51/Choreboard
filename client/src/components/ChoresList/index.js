import React, { useState } from "react";
import { useMutation, useQuery } from '@apollo/client';
import { QUERY_MYCHORES, QUERY_ME } from '../../utils/queries';
import { ADD_CHORE, EDIT_CHORE, REMOVE_CHORE } from '../../utils/mutations';
import { Modal, Button, Form, Table } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.css';

const defaultChore = { name: "", description: "", pointValue: 0 };

const ChoresList = () => {
  const [show, setShow] = useState(false);
  const [tabSelected, setTabSelected] = useState(1);
  const [newChore, setNewChore] = useState(defaultChore);

  const toggleTab = (index) => {
    setTabSelected(index);
  };
  const [addChore] = useMutation(ADD_CHORE);
  const [editChore] = useMutation(EDIT_CHORE);
  const [removeChore, { onCompleted }] = useMutation(REMOVE_CHORE);
  const clearAddChoreForm = () => {
    setNewChore({ ...defaultChore });
  };

  function handleDelete (choreId) {
    removeChore({ variables: { id: choreId } });
    onCompleted: refetch();
  }
  const handleSubmit = async (event) => {
    event.preventDefault();
    try {
      await addChore({
        variables: { name: newChore.name, description: newChore.description, pointValue: newChore.pointValue }
      });
      await refetch();
      setShow(false);
      clearAddChoreForm();
    } catch (e) {
      console.error(e);
    }
  };
  const handleClose = () => {
    setNewChore(defaultChore);
    setShow(false);
  };

  const setComplete = (e, choreId) => { editChore({ variables: { id: choreId, completedBy: e.target.value } }); };

  const handleShow = () => {

    tabSelected === 1 && setShow(true);
  };
  const queryUser = useQuery(QUERY_ME);
  const { loading, error, data, refetch } = useQuery(QUERY_MYCHORES);
  if (loading) return 'Loading...';
  if (error) return `Error! ${error.message}`;

  const user = queryUser.data?.me;

  return (
    <>
      <div className="container container--chores p-0">
        <div className="cb-tabs--chores">
          <button
            className={tabSelected === 1 ? "tabs--chores active-tabs--chores tab-1--chores noBorder--chores" : "tabs--chores noBorder--chores"}
            onClick={() => toggleTab(1)}
          >
            To-Do
          </button>
          <button
            className={tabSelected === 2 ? "tabs--chores active-tabs--chores tab-2--chores noBorder--chores" : "tabs--chores noBorder--chores"}
            onClick={() => toggleTab(2)}
          >
            Completed
          </button>
          <Button variant="primary" className={tabSelected === 1 ? "rightNav--chores addChoreBtn--chores" : " rightNav--chores addChoreBtn--chores disableBtn--chores"} onClick={handleShow}>
            + Add Chore
          </Button>
        </div>
        <div className="content-tabs--chores">
          <div
            className={tabSelected === 1 ? "content--chores  active-content--chores" : "content--chores"}
          >
            <div className="boardHeader--chores mb-5">
              <h2>My Chore Board</h2>
            </div>
            <div>

              <Table hover responsive>
                <thead>
                  <tr>
                    <th>Chore Name:</th>
                    <th>Chore Description</th>
                    <th>Chore Point Value</th>
                    <th>Completed By</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  {data ? data.myChores.choreList.filter(chore => !chore.completedBy).map((choreData) => (
                    <tr key={choreData._id}>
                      <td>{choreData.name}</td>
                      <td>{choreData.description}</td>
                      <td>{choreData.pointValue}</td>
                      <td>
                        <select onChange={(e) => setComplete(e, choreData._id)}>
                          <option defaultValue={""}>Select A Child</option>
                          {user.children.map((child) => (
                            <option key={child._id}
                              value={child._id}>
                              {child.name}
                            </option>

                          ))}
                        </select>
                      </td>
                      <td><button onClick={() => handleDelete(choreData._id)}>🚫</button></td>
                    </tr>
                  )) : (
                    <tr>
                      <td colSpan={2}>No Chores Yet!</td>
                    </tr>
                  )}
                </tbody>
              </Table>
            </div>
            <div className="choreBody--chores">

            </div>
          </div>
          <div
            className={
              tabSelected === 2
                ? "content--chores  active-content--chores"
                : "content--chores"
            }
          >
            <div className="boardHeader--chores mb-5">
              <h2>Completed Chores</h2>
            </div>
            <div>

              <Table hover responsive>
                <thead>
                  <tr>
                    <th>Chore Name:</th>
                    <th>Chore Description</th>
                    <th>Points Awarded</th>
                    <th>Completed By</th>
                  </tr>
                </thead>
                <tbody>
                  {data ? data.myChores.choreList.filter(chore => chore.completedBy).map(filteredData => (
                    <tr key={filteredData._id}>
                      <td>{filteredData.name}</td>
                      <td>{filteredData.description}</td>
                      <td>{filteredData.pointValue}</td>
                      <td>{filteredData.completedBy.name}</td>
                    </tr>
                  )) : (
                    <tr>
                      <td>No Chores Completed</td>
                    </tr>
                  )}
                </tbody>
              </Table>
            </div>
            <div className="mt-5 choreBody--chores">

            </div>
          </div>
        </div>
      </div>

      <Modal show={show} onHide={handleClose} className="addChoreModal--chores">
        <Form onSubmit={handleSubmit}>
          <Modal.Header closeButton>
            <Modal.Title>New Chore</Modal.Title>
          </Modal.Header>
          <Modal.Body>

            <Form.Group className="mb-3" controlId="ChoreForm.ControlInput1">
              <Form.Label>Chore Name:</Form.Label>
              <Form.Control
                type="text"
                name="choreName"
                value={newChore.name}
                onChange={(e) => setNewChore({ ...newChore, name: e.target.value })}
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
              <Form.Control
                as="textarea"
                value={newChore.description}
                onChange={(e) => setNewChore({ ...newChore, description: e.target.value })}
                name="choreDesc"
                rows={3}
                placeholder="Briefly Describe The Specifics Of The Chore" />
            </Form.Group>
            <Form.Group
              className="mb-3"
              controlId="ChoreForm.ControlTextarea2"
            >
              <Form.Label>Point Value:</Form.Label>
              <Form.Control
                value={newChore.pointValue}
                onChange={(e) => setNewChore({ ...newChore, pointValue: parseInt(e.target.value) })}
                className="text-secondary"
                name="chorePoints"
                style={{ width: 75 }}
                type="number"
                step="5"
                min="5"
                placeholder="5"
                required max="50"
              ></Form.Control>

            </Form.Group>

          </Modal.Body>
          <Modal.Footer>
            <Button variant="danger" onClick={handleClose}>
              Cancel
            </Button>
            <Button type="submit" variant="success">
              Add Chore
            </Button>
          </Modal.Footer>
        </Form>
      </Modal>
    </>
  );
};

export default ChoresList;
