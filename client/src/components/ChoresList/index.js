import React, { useState } from "react";
import { useMutation, useQuery } from '@apollo/client';
import { QUERY_MYCHORES } from '../../utils/queries';
import { ADD_CHORE, EDIT_CHORE, REMOVE_CHORE } from '../../utils/mutations';
import { Modal, Button, Form } from 'react-bootstrap';
import 'bootstrap/dist/css/bootstrap.css';

const ChoresList = () => {
  const [show, setShow] = useState(false);
  const [tabSelected, setTabSelected] = useState(1);
  const toggleTab = (index) => {
    setTabSelected(index);
  };

  const handleClose = () => setShow(false);


  const handleShow = () => {

    tabSelected === 1 && setShow(true);
  };

  const { loading, error, data } = useQuery(QUERY_MYCHORES);
  if (loading) return 'Loading...';
  if (error) return `Error! ${error.message}`;


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
            <div className="boardHeader--chores">
              <h2>My Chore Board</h2>
            </div>
            <div className="choreBody--chores mt-5">
              {data.myChores.choreList.filter(chore => !chore.completedBy).map((choreData) => (
                <div className="card p-4">{choreData.name} {''} {choreData.description}{''} {choreData.pointValue}{"!"}</div>
              ))}

            </div>
          </div>

          <div
            className={
              tabSelected === 2
                ? "content--chores  active-content--chores"
                : "content--chores"
            }
          >
            <div className="boardHeader--chores">
              <h2>Completed Chores</h2>
            </div>
            <div className="mt-5 choreBody--chores">
              {data.myChores.choreList.filter(chore => chore.completedBy).map(filteredData => (
                <div className="card p-4">
                  {"The chore:"}{' '}{filteredData.name}{' '}{" was completed by: "}{' '}{filteredData.completedBy.name}{' '}{" for a total of: "}{filteredData.pointValue}{' '} {" points!"}
                </div>
              ))}
            </div>
          </div>
        </div>
      </div>
      <Modal show={show} onHide={handleClose} className="addChoreModal--chores">
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
