import React, { useState } from "react";
import {useNavigate} from "react-router-dom";
import Button from '@mui/material/Button';


function UserDashboard() {
    const navigate = useNavigate();
    const[isLoggedin, setIsLoggedin] = useState(true);

    const logout = () => {
        localStorage.removeItem('session');
        setIsLoggedin(false);
        navigate("/users/login")
    };
    return (
        <div className="UserDashboard">
           
            {isLoggedin ? 
            (
                <Button onClick={logout} variant="contained" type="submit" sx={{
                display: 'flex',
                flexDirection: 'column',
                marginTop: 2,
                marginLeft: 5
            }}>Logout</Button>) : (<p>Login first!</p>)
            }
        </div>
    );
   
}

export default UserDashboard;