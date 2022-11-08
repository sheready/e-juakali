import React, {useState} from "react";
import {useNavigate} from "react-router-dom";
import TextField from '@mui/material/TextField';
import Input from '@mui/material/Input';
import InputLabel from '@mui/material/InputLabel';
import Button from '@mui/material/Button';
import Visibility from '@mui/icons-material/Visibility';
import VisibilityOff from '@mui/icons-material/VisibilityOff';
import InputAdornment from '@mui/material/InputAdornment';
import IconButton from '@mui/material/IconButton';
import AccountCircle from '@mui/icons-material/AccountCircle';
import Container from '@mui/material/Container';

function LoginCustomer() {
    const [inputs, setInputs] = useState({
        email:'',
        password:'',
        showPassword:false
    });
    const navigate = useNavigate();

    const handleChange = (e) => {
        const name = e.target.name;
        const value = e.target.value;
        setInputs(values => ({...values, [name]: value}))
    }

    const handleSubmit = (e) => {
        e.preventDefault();
        fetch("http://127.0.0.1:3000/users/login",{
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({user: {
                email:inputs.email,
                password: inputs.password
            }},
            )
        })
        .then(response => response.json())
        .then(user =>{
            console.log(user)
            setInputs(user)
            window.localStorage.setItem('session', JSON.stringify(user.id))
            navigate("/users/dashboard")
        }
        ).catch(err => console.log("Login error", err));

       
        
    }

    const handleClickShowPassword = () => {
        setInputs({
          ...inputs,
          showPassword: !inputs.showPassword,
        });
    };
    
    const handleMouseDownPassword = (event) => {
        event.preventDefault();
    };

    return (
        <Container maxWidth="sm" sx={{
            display: 'flex',
            flexDirection: 'column',
            marginTop: 15
        }}>
            <form onSubmit={handleSubmit}>
                <InputLabel htmlFor="input-with-icon-textfield">Email:</InputLabel>
                <TextField
                    id="input-with-icon-textfield"
                    name="email"
                    InputProps={{
                    endAdornment: (
                        <InputAdornment position="end">
                        <AccountCircle />
                        </InputAdornment>
                    ),
                    }}
                    value={inputs.email}
                    onChange={handleChange}
                    variant="standard"
                    margin="dense" 
               
                />
                <InputLabel htmlFor="standard-adornment-password"  sx={{
                        marginTop: 2
                    }}>Password:</InputLabel>
                <Input
                    id="standard-adornment-password"
                    name="password"
                    type={inputs.showPassword ? 'text' : 'password'}
                    value={inputs.password}
                    onChange={handleChange}
                    endAdornment={
                    <InputAdornment position="end">
                        <IconButton
                        aria-label="toggle password visibility"
                        onClick={handleClickShowPassword}
                        onMouseDown={handleMouseDownPassword}
                        >
                        {inputs.showPassword ? <VisibilityOff /> : <Visibility />}
                        </IconButton>
                    </InputAdornment>
                    }
                
                />
                <Button variant="contained" type="submit" sx={{
                    display: 'flex',
                    flexDirection: 'column',
                    marginTop: 2,
                    marginLeft: 5
                }}>Customer Login</Button>
            </form>
        </Container>
    );
   
}

export default LoginCustomer;