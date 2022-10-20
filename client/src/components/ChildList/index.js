import React from 'react'
// import { Link } from 'react-router-dom';

const ChildList = ({childCount, username, children}) => {

    if(!children || !children.length) {
        return <p>{username}, Add your children</p>
    }

    return (
        <div>
            <h5> {username}'s {childCount} {childCount === 1 ? 'child' : 'children'}</h5>
            {children.map(children => (
                {children}
            ))}
        </div>
    );
};

export default ChildList;