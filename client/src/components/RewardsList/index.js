import React, { useState } from "react";
import { Form, Modal, Button, Table } from "react-bootstrap";
import { useMutation, useQuery } from '@apollo/client';
import { QUERY_ME } from "../../utils/queries";
import { ADD_REWARD, CLAIM_REWARD, REMOVE_REWARD } from '../../utils/mutations';
import 'bootstrap/dist/css/bootstrap.css';
import { FaTrashAlt } from 'react-icons/fa';

const defaultReward = { name: "", description: "", cost: 0 };
const RewardsList = () => {
  const [show, setShow] = useState(false);
  const [tabSelected, setTabSelected] = useState(1);
  const [newReward, setNewReward] = useState(defaultReward);
  const toggleTab = (index) => {
    setTabSelected(index);
  };
  const [addReward] = useMutation(ADD_REWARD);
  const [claimReward] = useMutation(CLAIM_REWARD);
  const [removeReward] = useMutation(REMOVE_REWARD);
  const { loading, error, data, refetch } = useQuery(QUERY_ME);

  const clearAddRewardForm = () => {
    setNewReward({ ...defaultReward });
  };


  async function handleDelete (rewardId) {
    await removeReward({ variables: { id: rewardId } });
    refetch();
  }

  const handleSubmit = async (event) => {
    event.preventDefault();
    try {
      await addReward({
        variables: { name: newReward.name, description: newReward.description, cost: newReward.cost }
      });
      await refetch();
      setShow(false);
      clearAddRewardForm();
    } catch (e) {
      console.error(e);
    }
  };

  const handleClose = () => {
    setNewReward(defaultReward);
    setShow(false);
  };

  const setComplete = async (e, rewardId) => {
    await claimReward({
      variables: {
        id: rewardId,
        claimedBy: e.target.value
      }
    });
    refetch();
  };


  const handleShow = () => {
    tabSelected === 1 && setShow(true);
  };

  if (loading) return 'Loading...';
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
            <div className="boardHeader--rewards mb-5">
              <h2>My Rewards</h2>
            </div>
            <div>

              <Table hover responsive>
                <thead>
                  <tr>
                    <th>Reward Name</th>
                    <th>Reward Description</th>
                    <th>Reward Cost</th>
                    <th>Claim Reward</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  {data ? data.me.rewardList.filter(reward => !reward.claimedBy).map((rewardData) => (
                    <tr key={rewardData._id}>
                      <td>{rewardData.name}</td>
                      <td>{rewardData.description}</td>
                      <td>{rewardData.cost}</td>
                      <td>
                        <select onChange={(e) => setComplete(e, rewardData._id)}>
                          <option defaultValue={""}>Select A Child</option>
                          {data.me.children.map((child) => (
                            <option key={child._id}
                              value={child._id}>
                              {child.name}
                            </option>

                          ))}
                        </select>
                      </td>
                      <td><button className="btn bg-transparent" onClick={() => handleDelete(rewardData._id)}><FaTrashAlt /></button></td>
                    </tr>
                  )) : (
                    <tr>
                      <td colSpan={2}>No Rewards Yet!</td>
                    </tr>
                  )}
                </tbody>
              </Table>
            </div>
          </div>

          <div
            className={
              tabSelected === 2
                ? "content--rewards  active-content--rewards"
                : "content--rewards"
            }
          >
            <div className="boardHeader--rewards mb-5">
              <h2>Claimed By</h2>
            </div>
            <div>
              <Table hover responsive>
                <thead>
                  <tr>
                    <th>Reward Name</th>
                    <th>Reward Description</th>
                    <th>Points Deducted</th>
                    <th>Claimed By</th>
                  </tr>
                </thead>
                <tbody>
                  {data ? data.me.rewardList.filter(reward => reward.claimedBy).map(filteredData => (
                    <tr key={filteredData._id}>
                      <td>{filteredData.name}</td>
                      <td>{filteredData.description}</td>
                      <td>{filteredData.cost}</td>
                      <td>{filteredData.claimedBy.name}</td>
                    </tr>
                  )) : (
                    <tr>
                      <td>No Rewards Completed</td>
                    </tr>
                  )}
                </tbody>
              </Table>
            </div>
            <div className="mt-5 rewardBody--rewards">

            </div>
          </div>
        </div>
      </div>
      <Modal show={show} onHide={handleClose} className="addRewardsModal--rewards">
        <Form onSubmit={handleSubmit}>
          <Modal.Header closeButton>
            <Modal.Title>New Reward</Modal.Title>
          </Modal.Header>
          <Modal.Body>
            <Form.Group className="mb-3" controlId="RewardForm.ControlInput1">
              <Form.Label>Reward Name:</Form.Label>
              <Form.Control
                type="text"
                name="rewardName"
                value={newReward.name}
                onChange={(e) => setNewReward({ ...newReward, name: e.target.value })}
                placeholder="Enter Reward Here"
                required
                autoFocus
              />
            </Form.Group>
            <Form.Group className="mb-3" controlId="RewardForm.ControlTextarea1">
              <Form.Label>Reward Description:</Form.Label>
              <Form.Control
                as="textarea"
                value={newReward.description}
                onChange={(e) => setNewReward({ ...newReward, description: e.target.value })}
                name="rewardDesc"
                rows={3}
                placeholder="Briefly Describe The Specifics Of The Reward"
              />
            </Form.Group>
            <Form.Group className="mb-3" controlId="RewardForm.ControlTextarea2">
              <Form.Label>Cost:</Form.Label>
              <Form.Control
                value={newReward.cost}
                onChange={(e) => setNewReward({ ...newReward, cost: parseInt(e.target.value) })}
                className="text-secondary"
                name="rewardPoints"
                style={{ width: 75 }}
                type="number"
                step="5"
                inputMode="numeric"
                min="5"
                placeholder="5"
                required
                max="50"
              ></Form.Control>
            </Form.Group>
          </Modal.Body>
          <Modal.Footer>
            <Button variant="danger" onClick={handleClose}>
              Cancel
            </Button>
            <Button type="submit" variant="success">
              Add Reward
            </Button>
          </Modal.Footer>
        </Form>
      </Modal>
    </>
  );
};

export default RewardsList;
