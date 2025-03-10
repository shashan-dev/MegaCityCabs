<%-- 
    Document   : SignIn
    Created on : 26 Feb 2025, 22:36:51
    Author     : Shashan(ShashanPrabo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign In - Mega City Cabs</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./Styles/style.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body class="bg-black text-white signin-page">


        <!-- Header -->
        <header class=" text-white py-3">
            <div class="container">
                <div class="d-flex justify-content-between align-items-center">
                    <div class="company-name">
                        <h1 class="  h3 mb-0 text-orange fw-bold"><a href="index.jsp" class="header-link">Mega City Cabs</a></h1>
                    </div>
                    <div class="contact-info d-none d-md-block">
                        <p class=" mb-0">Call us: <span class="text-orange">+1 234 567 890</p>
                    </div>

                </div>
            </div>
        </header>

        <!-- Notification -->
        <%
            String registrationStatus = request.getParameter("error");
            if (registrationStatus != null && registrationStatus.contains("login_failed")) {
        %>
        <div class="notification alert alert-danger alert-dismissible fade show small-alert-error" role="alert">
            <strong >Error!</strong> Invalid login details.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close" onclick="window.location.href = 'SignIn.jsp'"></button>
        </div>
        <%
            }
        %>



        <div class="container d-flex justify-content-center align-items-center  p-4 mt-5">
            <div class="card bg-dark text-white p-4 " style="width: 100%; max-width: 400px;">
                <h2 class="text-center mb-4 text-orange">Sign In</h2>

                <!-- Toggle  for Customer/Employee -->
                <div class="d-flex justify-content-center mb-4">
                    <button id="customerBtn" class="btn btn-outline-orange me-2 active">Customer</button>
                    <button id="employeeBtn" class="btn btn-outline-orange">Employee</button>
                </div>

                <!-- Customer Login Form -->
                <form id="customerForm" action="SignInServlt" method="POST">
                    <input type="hidden" name="loginType" value="customer">
                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" name="email" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control" id="password" name="password" required>
                    </div>
                    <button type="submit" class="btn btn-orange w-100">Sign In</button>
                    <hr>
                    <p class="text-center">No account? <a href="SignUp.jsp" class="text-orange"> Create one!</a></p>
                </form>


                <!-- Employee Login Form -->
                <form id="employeeForm" class="d-none" action="SignInServlt" method="POST">
                    <input type="hidden" name="loginType" value="employee">
                    <div class="mb-3">
                        <label for="empId" class="form-label">Employee ID</label>
                        <input type="number" class="form-control" id="empId" name="userId" required>
                    </div>
                    <div class="mb-3">
                        <label for="empPassword" class="form-label">Password</label>
                        <input type="password" class="form-control" id="empPassword" name="userPassword" required>
                    </div>
                    <button type="submit" class="btn btn-orange w-100">Sign In</button>
                </form>

            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

        <script>
                              // Toggle between Customer and Employee forms
                              const customerBtn = document.getElementById('customerBtn');
                              const employeeBtn = document.getElementById('employeeBtn');
                              const customerForm = document.getElementById('customerForm');
                              const employeeForm = document.getElementById('employeeForm');

                              customerBtn.addEventListener('click', () => {
                                  customerBtn.classList.add('active');
                                  employeeBtn.classList.remove('active');
                                  customerForm.classList.remove('d-none');
                                  employeeForm.classList.add('d-none');
                              });

                              employeeBtn.addEventListener('click', () => {
                                  employeeBtn.classList.add('active');
                                  customerBtn.classList.remove('active');
                                  employeeForm.classList.remove('d-none');
                                  customerForm.classList.add('d-none');
                              });
        </script>
    </body>
</html>
