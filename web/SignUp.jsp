<%-- 
    Document   : SignUp
    Created on : 27 Feb 2025, 19:44:16
    Author     : Shashan(ShashanPrabo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up - Mega City Cabs</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom CSS -->
  <link rel="stylesheet" href="./Styles/style.css">
</head>
<body class="bg-black text-white signin-page">
    <header class="text-white py-3">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <!-- Company Name -->
                <div class="company-name">
                    <h1 class="h3 mb-0 text-orange fw-bold"><a href="index.jsp" class="header-link">Mega City Cabs</a></h1>
                </div>

                <!-- Contact Info -->
                <div class="contact-info d-none d-md-block">
                    <p class="mb-0">Call us: <span class="text-orange">+1 234 567 890</span></p>
                </div>
            </div>
        </div>
    </header>

    <div class="container d-flex justify-content-center align-items-center p-4 mt-5">
        <div class="card bg-dark text-white p-4" style="width: 100%; max-width: 400px;">
            <h2 class="text-center mb-4 text-orange">Sign Up</h2>

            <!-- Customer Registration Form -->
            <form id="signupForm">
                <div class="mb-3">
                    <label for="name" class="form-label">Name</label>
                    <input type="text" class="form-control" id="name" required>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" class="form-control" id="email" required>
                </div>
                <div class="mb-3">
                    <label for="nic" class="form-label">NIC</label>
                    <input type="text" class="form-control" id="nic" required>
                </div>
                <div class="mb-3">
                    <label for="mobile" class="form-label">Mobile Number</label>
                    <input type="tel" class="form-control" id="mobile" required>
                </div>
                <div class="mb-3">
                    <label for="address" class="form-label">Address</label>
                    <input type="text" class="form-control" id="address" required>
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" required>
                </div>
                <button type="submit" class="btn btn-orange w-100">Sign Up</button>
                <hr>
                <p class="text-center">Already have an account? <a href="SignIn.jsp" class="text-orange">Sign In</a></p>
            </form>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
