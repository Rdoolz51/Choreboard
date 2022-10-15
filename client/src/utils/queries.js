const { gql } = require('apollo-server-express');


export const QUERY_USERS = gql`
    query Users {
        users {
        _id
        username
        email
        password
        childCount
        children {
            _id
            name
            points
        }
        choreList {
            _id
            name
            description
            pointValue
            completedBy {
            _id
            name
            points
            }
        }
        }
    }
    `;

export const QUERY_USER = gql`
    query User($username: String!) {
        user(username: $username) {
            _id
            username
            email
            password
            childCount
            children {
                _id
                name
                points
            }
            choreList {
                _id
                name
                description
                pointValue
                completedBy {
                _id
                name
                points
                }
            }
        }
    }
`;

export const QUERY_CHORES = gql`
    query Chore {
        chore {
            _id
            name
            description
            pointValue
            completedBy {
                _id
                name
                points
            }
        }
    }
`;

export const QUERY_REWARDS = gql`
    query Reward {
        reward {
            _id
            name
            description
            cost
        }
    }
`;