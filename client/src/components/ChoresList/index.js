import React, { useState } from "react";
import { useMutation, useQuery } from '@apollo/client';
import { ADD_CHORE, EDIT_CHORE, REMOVE_CHORE } from '../../utils/mutations';
import { QUERY_MYCHORES } from '../../utils/queries';
import Auth from '../../utils/auth';
const ChoresList = () => {
    const { loading, error, data } = useQuery(QUERY_MYCHORES);
    if (loading) return 'Loading...';
    if (error) return `Error! ${error.message}`;
    //TODO: Build chore list structure with hard coded data. Then implement mutations/queries
    return (
        // {data.choreList.map((chore) => ())}    
        <>asd</>
    );
};
export default ChoresList;