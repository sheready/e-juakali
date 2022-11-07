import React, { useEffect, useState } from "react";


function GetUsers() {
    let [userData, setUserData] = useState([])

        useEffect(() => {
            fetch("http://127.0.0.1:3000/users/users")
            .then(response => response.json())
            .then(data => {setUserData(data)
            console.log(data)})
            
        },[])

    return (
        <div className="GetUsers">
         
        </div>
        
    );
   
}

export default GetUsers;