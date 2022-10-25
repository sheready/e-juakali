import { BrowserRouter, Routes, Route } from "react-router-dom";
import './App.css';
import AdminDashboard from "./components/Admin_dashboard";
import Home from "./components/Home";
import LoginAdmin from "./components/Login_admin";
import LoginCustomer from "./components/Login_customer";
import LoginVendor from "./components/Login_vendor";
import SignInAdmin from "./components/Signup_admin";
import SignInCustomer from "./components/Signup_customer";
import SignInVendor from "./components/Signup_vendor";
import VendorDashboard from "./components/Vendor_dashboard";

function App() {
  return (
    <BrowserRouter>
    <Routes> 
        <Route path="/" element={<Home/>} /> 
        <Route path="admins/dashboard" element={<AdminDashboard/>} />
        <Route path="vendors/dashboard" element={<VendorDashboard/>} />
        <Route path="vendors/login" element={<LoginVendor />} />
        <Route path="users/login" element={<LoginCustomer />} />
        <Route path="admins/login" element={<LoginAdmin />} />
        <Route path="vendors/signup" element={<SignInVendor />} />
        <Route path="admins/signup" element={<SignInAdmin />} />
        <Route path="users/signup" element={<SignInCustomer />} />
    </Routes>
     </BrowserRouter>
    // <div className="App">
    //   <Navbar/>
    //   <Footer/>
    // </div>
  );
}

export default App;
