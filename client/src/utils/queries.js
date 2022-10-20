import { gql } from '@apollo/client';

//gets all users and all info
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
      rewardList {
        _id
        name
        description
        cost
        claimedBy {
          _id
          name
          points
        }
      }
    }
  }
    `;
//gets logged in user and all info
export const QUERY_ME = gql`
query Me {
    me {
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
      rewardList {
        _id
        name
        description
        cost
        claimedBy {
          _id
          name
          points
        }
      }
    }
  }
`;
//gets all chores for all users
export const QUERY_CHORES = gql`
query Chore {
    chore {
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
//gets all chores for logged in user
export const QUERY_MYCHORES = gql`
query MyChores {
    myChores {
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

export const QUERY_REWARDS = gql`
query Reward {
    reward {
      _id
      name
      description
      cost
      claimedBy {
        _id
      }
    }
  }
`;

export const QUERY_MYREWARDS = gql`
query MyRewards {
    myRewards {
      rewardList {
        _id
        name
        description
        cost
      }
    }
  }
`;