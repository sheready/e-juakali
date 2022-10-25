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

function SignInVendor() {
    const [inputs, setInputs] = useState({
        email:'',
        password:'',
        password_confirmation:'',
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
        fetch("http://127.0.0.1:3000/vendors/signup",{
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({user: {
                email:inputs.email,
                password: inputs.password,
                password_confirmation: inputs.password_confirmation
            }},
            )
        })
        .then(response => response.json())
        .then(user =>{
            console.log(user)
            setInputs(user)
            navigate("/vendors/dashboard")
        }
        ).catch(err => console.log("Signin error", err));

       
        
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
        <form onSubmit={handleSubmit}>
            <TextField
                id="input-with-icon-textfield"
                label="Enter your email address:"
                name="email"
                InputProps={{
                startAdornment: (
                    <InputAdornment position="start">
                    <AccountCircle />
                    </InputAdornment>
                ),
                }}
                value={inputs.email}
                onChange={handleChange}
                variant="standard"
            />
            <InputLabel htmlFor="standard-adornment-password">Password</InputLabel>
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
            <InputLabel htmlFor="standard-adornment-password">Confirm Password</InputLabel>
            <Input
                id="standard-adornment-password"
                name="password_confirmation"
                type={inputs.showPassword ? 'text' : 'password'}
                value={inputs.password_confirmation}
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
                <Button variant="contained" type="submit">Vendor SignUp</Button>
        </form>
    );
   
}

export default SignInVendor;