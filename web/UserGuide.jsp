<%-- 
    Document   : UserGuide
    Created on : 13 Mar 2025, 22:25:26
    Author     : Shashan(ShashanPrabo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Guide - Mega City Cabs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <link rel="stylesheet" href="./Styles/style.css">

</head>
<body class="bg-dark text-white" >

<header class="text-white py-3">
            <div class="container">
                <div class="d-flex justify-content-between align-items-center">
                    <div class="company-name">
                        <h1 class="h3 mb-0 text-orange fw-bold"><a href="index.jsp" class="header-link">Mega City Cabs</a></h1>
                    </div>
                    <div class="contact-info d-none d-md-block">
                        <p class="mb-0">Call us: <span class="text-orange">+1 234 567 890</span></p>
                    </div>
                </div>
            </div>
        </header>

<div class="container mt-5 pt-5 ">
    <h2 class="text-center guide-title">📖 User Guide - Booking Process</h2>
    <p class="text-center text-white">Follow these steps to register, book a ride, and manage your trips.</p>

    <div class="guide-container">
        
        <div class="guide-step">
            <h5><i class="fas fa-user-plus"></i> User Registration</h5>
            <p>1. Click <b>Sign Up</b>.</p>
            <p>2. Fill in your details.</p>
            <p>3. Click the <b>Sign Up</b> button to complete registration.</p>
        </div>
        
        <br>
        
        <div class="guide-step">
            <h5><i class="fas fa-sign-in-alt"></i> User Login</h5>
            <p>1. Click <b>Sign In</b>.</p>
            <p>2. Select <b>Customer</b> role.</p>
            <p>3. Enter your registered email and password.</p>
            <p>4. Click <b>Sign In</b> to access your account.</p>
        </div>

        <br>
        
        <div class="guide-step">
            <h5><i class="fas fa-car"></i> Creating a New Booking</h5>
            <p>1. Click <b>New Booking</b>.</p>
            <p>2. Select <b>Pickup Location</b> and <b>Drop Location</b>.</p>
            <p>3. Choose the <b>Vehicle Type</b> and click <b>Find</b>.</p>
            <p>4. The system will display available vehicles based on your selection.</p>
            <p>5. Select a <b>Vehicle Name</b>, then choose a <b>Date</b> and <b>Time</b>.</p>
            <p>6. Select a <b>Payment Method</b> and click <b>Submit</b>.</p>
        </div>

        <br>
        
        <div class="guide-step">
            <h5><i class="fas fa-receipt"></i> Receipt & Confirmation</h5>
            <p>1. After submission, you will be navigated to the receipt page.</p>
            <p>2. Click <b>Print</b> to get a copy of your receipt.</p>
            <p>3. Click <b>Home</b> to return to the main page.</p>
            <p><b>Your booking is now complete! 🎉</b></p>
        </div>

        <br>
        
        <div class="guide-step">
            <h5><i class="fas fa-history"></i> Booking History</h5>
            <p>1. Log in to the system.</p>
            <p>2. Click on <b>Booking History</b>.</p>
            <p>3. View all past bookings.</p>
            <p>4. Use the <b>Order No</b> search feature to find specific bookings.</p>
        </div>

        <br>
        
        <div class="guide-step">
            <h5><i class="fas fa-sign-out-alt"></i> Signing Out</h5>
            <p>Click the <b>Sign Out</b> button in the top left corner to securely log out.</p>
        </div>

    </div>

    <div class="text-center mt-4">
        <a href="index.jsp" class="btn btn-orange">Back to Home</a>
    </div>
</div>
    
            <!-- Footer Section -->
        <footer class="bg-black text-white py-5 mt-5">
            <div class="container">
                <div class="row">
                    <!-- Company Address -->
                    <div class="col-md-4 mb-4">
                        <h5 class="text-orange mb-3">Our Address</h5>
                        <p class="mb-0"><i class="fa fa-map-marker"></i> 123 Main Street, Mega City, Sri Lanka</p>
                    </div>

                    <!-- Contact Number -->
                    <div class="col-md-4 mb-4">
                        <h5 class="text-orange mb-3">Contact Us</h5>
                        <p class="mb-0"><i class="fa fa-phone"></i> +1 234 567 890</p>
                    </div>

                    <!-- Social Media -->
                    <div class="col-md-4 mb-4">
                        <h5 class="text-orange mb-3">Follow Us</h5>
                        <ul class="list-unstyled d-flex">
                            <li class="me-3">
                                <a href="#" class="text-white text-decoration-none">
                                    <i class="fab fa-facebook fa-2x"></i>
                                </a>
                            </li>
                            <li class="me-3">
                                <a href="#" class="text-white text-decoration-none">
                                    <i class="fab fa-twitter fa-2x"></i>
                                </a>
                            </li>
                            <li class="me-3">
                                <a href="#" class="text-white text-decoration-none">
                                    <i class="fab fa-instagram fa-2x"></i>
                                </a>
                            </li>
                        </ul>
                    </div>
                    
          
                </div>

                <!-- Copyright Notice -->
                <div class="text-center mt-3">
                    <p class="mb-0">© 2025 Mega City Cabs. All rights reserved.</p>
                </div>
            </div>
        </footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
