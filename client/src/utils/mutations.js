import { gql } from "@apollo/client";

export const ADD_USER = gql`
    mutation AddUser($username: String!, $email: String!, $password: String!) {
        addUser(username: $username, email: $email, password: $password) {
            token
        }
    }
`;

export const LOGIN_USER = gql`
    mutation Login($email: String!, $password: String!) {
        login(email: $email, password: $password) {
            token
        }
    }
`;

export const CHANGE_PASSWORD = gql`
    mutation ChangePassword($currentPassword: String!, $password: String!) {
        changePassword(currentPassword: $currentPassword, password: $password) {
            token
        }
    }
`;

export const REMOVE_USER = gql`
mutation RemoveUser($id: ID!) {
    removeUser(_id: $id) {
      _id
    }
  }
`;

export const ADD_CHORE = gql`
    mutation AddChore($name: String!, $description: String, $pointValue: Int!) {
        addChore(name: $name, description: $description, pointValue: $pointValue) {
            _id
        }
    }
  
`;

export const EDIT_CHORE = gql`
    mutation EditChore($id: ID!, $completedBy: ID!) {
        editChore(_id: $id, completedBy: $completedBy) {
            _id
            name
            description
            pointValue
            completedBy {
                _id
            }
        }
    } 
`;

export const REMOVE_CHORE = gql`
    mutation RemoveChore($id: ID!) {
        removeChore(_id: $id) {
        _id
        }
    }
`;

export const ADD_REWARD = gql`
    mutation AddReward($name: String!, $description: String, $cost: Int!) {
        addReward(name: $name, description: $description, cost: $cost) {
            _id
        }
    }
`;

export const CLAIM_REWARD = gql`
    mutation EditReward($id: ID!, $claimedBy: ID!) {
        editReward(_id: $id, claimedBy: $claimedBy) {
            claimedBy {
                _id
            }
        }
    }
`;


export const ADD_CHILD = gql`
    mutation AddChild($name: String!, $points: Int) {
        addChild(name: $name, points: $points) {
            _id
            name
            points
        }
    }
`;

export const REMOVE_CHILD = gql`
    mutation RemoveChild($id: ID!) {
        removeChild(_id: $id) {
            _id
        }
    }
`;