import React, { useState } from "react";
import { Form, Modal, Button } from "react-bootstrap";

const RewardsList = () => {
    const [show, setShow] = useState(false);
    const [tabSelected, setTabSelected] = useState(1);
    const toggleTab = (index) => {
      setTabSelected(index);
    };
  
    const handleClose = () => setShow(false);
  
    const handleShow = () => {
      tabSelected === 1 && setShow(true);
    };
  
  
    return (
      <>
        <div className="container container--rewards p-0">
          <div className="cb-tabs--rewards">
            <button
              className={
                tabSelected === 1
                  ? "tabs--rewards active-tabs--rewards tab-1--rewards noBorder--rewards"
                  : "tabs--rewards noBorder--rewards"
              }
              onClick={() => toggleTab(1)}
            >
              Rewards
            </button>
            <button
              className={
                tabSelected === 2
                  ? "tabs--rewards active-tabs--chores tab-2--chores noBorder--rewards"
                  : "tabs--rewards noBorder--rewards"
              }
              onClick={() => toggleTab(2)}
            >
              Claimed
            </button>
            <Button
              variant="primary"
              className={
                tabSelected === 1
                  ? "rightNav--rewards addChoreBtn--rewards"
                  : " rightNav--rewards addChoreBtn--rewards disableBtn--rewards"
              }
              onClick={handleShow}
            >
              + Add Reward
            </Button>
          </div>
  
          <div className="content-tabs--rewards">
            <div
              className={
                tabSelected === 1
                  ? "content--rewards  active-content--rewards"
                  : "content--rewards"
              }
            >
              <div className="boardHeader--rewards">
                <h2>Rewards</h2>
              </div>
            </div>
  
            <div
              className={
                tabSelected === 2
                  ? "content--rewards  active-content--rewards"
                  : "content--rewards"
              }
            >
              <div className="boardHeader--rewards">
                <h2>Claimed</h2>
              </div>
            </div>
          </div>
        </div>
        <Modal show={show} onHide={handleClose} className="addChoreModal--rewards">
          <Modal.Header closeButton>
            <Modal.Title>New Reward</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <Form>
              <Form.Group className="mb-3" controlId="ChoreForm.ControlInput1">
                <Form.Label>Reward Name:</Form.Label>
                <Form.Control
                  type="text"
                  name="rewardName"
                  placeholder="Enter Reward Here"
                  required
                  autoFocus
                />
              </Form.Group>
              <Form.Group className="mb-3" controlId="ChoreForm.ControlTextarea1">
                <Form.Label>Reward Description:</Form.Label>
                <Form.Control
                  as="textarea"
                  name="rewardDesc"
                  rows={3}
                  placeholder="Briefly Describe The Specifics Of The Reward"
                />
              </Form.Group>
              <Form.Group className="mb-3" controlId="ChoreForm.ControlTextarea2">
                <Form.Label>Cost:</Form.Label>
                <Form.Control
                  className="text-secondary"
                  name="rewardPoints"
                  style={{ width: 75 }}
                  type="number"
                  step="5"
                  min="5"
                  placeholder="5"
                  required
                  max="50"
                ></Form.Control>
              </Form.Group>
            </Form>
          </Modal.Body>
          <Modal.Footer>
            <Button variant="danger" onClick={handleClose}>
              Cancel
            </Button>
            <Button type="submit" variant="success" onClick={handleClose}>
              Add Reward
            </Button>
          </Modal.Footer>
        </Modal>
      </>
  );
};

export default RewardsList;
