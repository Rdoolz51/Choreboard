import React, { useState } from "react";
import { Form, Modal, Button } from "react-bootstrap";
import { useQuery } from '@apollo/client';
import { QUERY_MYREWARDS } from "../../utils/queries";

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

    const { loading, error, data } = useQuery(QUERY_MYREWARDS);
    if(loading) return 'Loading...'
    if (error) return `Error! ${error.message}`;
  
  
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
                  ? "tabs--rewards active-tabs--rewards tab-2--rewards noBorder--rewards"
                  : "tabs--rewards noBorder--rewards"
              }
              onClick={() => toggleTab(2)}
            >
              Claimed By
            </button>
            <Button
              variant="primary"
              className={
                tabSelected === 1
                  ? "rightNav--rewards addRewardBtn--rewards"
                  : " rightNav--rewards addRewardBtn--rewards disableBtn--rewards"
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
                <h2>My Rewards</h2>
              </div>

              <div className="rewardBody--rewards mt-5">
                {data.myRewards.rewardList.map((reward) => (
                    <div className="card p-4">
                        { reward.name }{" "}
                        { reward.description }{" "} 
                        { reward.cost }
                    </div>
                ))}
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
                <h2>Claimed By</h2>
              </div>
            </div>
          </div>
        </div>
        <Modal show={show} onHide={handleClose} className="addRewardsModal--rewards">
          <Modal.Header closeButton>
            <Modal.Title>New Reward</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <Form>
              <Form.Group className="mb-3" controlId="RewardForm.ControlInput1">
                <Form.Label>Reward Name:</Form.Label>
                <Form.Control
                  type="text"
                  name="rewardName"
                  placeholder="Enter Reward Here"
                  required
                  autoFocus
                />
              </Form.Group>
              <Form.Group className="mb-3" controlId="RewardForm.ControlTextarea1">
                <Form.Label>Reward Description:</Form.Label>
                <Form.Control
                  as="textarea"
                  name="rewardDesc"
                  rows={3}
                  placeholder="Briefly Describe The Specifics Of The Reward"
                />
              </Form.Group>
              <Form.Group className="mb-3" controlId="RewardForm.ControlTextarea2">
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
