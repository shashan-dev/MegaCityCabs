<%-- 
    Document   : CustomerBooking
    Created on : 28 Feb 2025, 21:08:17
    Author     : Shashan(ShashanPrabo
--%>

<%@page import="src.app.model.Receipt"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Driver Portal - Mega City Cabs</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./Styles/style.css">
    </head>
    <body class="booking-portal">
        <header class="text-white py-3 bg-dark">
            <div class="container">
                <div class="d-flex justify-content-between align-items-center">
                    <div class="company-name">
                        <h1 class="h3 mb-0 text-orange fw-bold">
                            <a href="" class="header-link text-decoration-none text-orange">Mega City Cabs</a>
                        </h1>
                    </div>
                    <div class="contact-info d-none d-md-block">
                        <p class="mb-0">Hi, <span class="text-orange">${sessionScope.user.userName}</span></p>
                    </div>
                    <a href="LogOutServlt" class="btn btn-orange btn-sm">Logout</a>
                </div>
            </div>
        </header>

        <div class="container-fluid">
            <div class="row vh-100">
                <!-- Sidebar for Tabs -->
                <div class="col-md-3 col-lg-2 bg-dark text-white sidebar mt-5">
                    <h2 class="text-center text-orange py-4 fw-bold pt-4" >Driver Portal</h2>
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a href="#" class="nav-link btn-tab  btn btn-orange w-100 active" data-tab="assign-me">Assigned to Me</a>
                        </li>
                        <!-- comment 
                        <li class="nav-item">
                            <a href="#" class="nav-link btn-tab  btn btn-orange w-100" data-tab="my-history">My History</a>
                        </li>
                          -->
                    </ul>

                </div>

                <!-- Main Content -->
                <div class="col-md-9 col-lg-10 main-content mt-5 ">
                    <hr>

                    <div id="assign-me" class="tab-content active">
                        <h3 class="text-orange mb-4 fw-bold">Assigned to Me</h3>
                        <table class="table table-bordered text-white">
                        <thead>
                            <tr>
                                <th>Booking ID</th>
                                <th>Date & Time</th>
                                <th>Pickup Location</th>
                                <th>Drop Location</th>
                                <th>Client Name</th>
                                <th>Vehicle Number</th>
                                <th>Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Receipt> myBooking = (List<Receipt>) request.getAttribute("driverBooking");
                                if (myBooking != null) {
                                    for (Receipt mybook : myBooking) {

                            %>
                            <tr>
                                <td><%= mybook.getOrderNumber()%></td>
                                <td><%= mybook.getBookingDateTime()%></td>
                                <td><%= mybook.getStartLocation()%></td>
                                <td><%= mybook.getEndLocation()%></td>
                                <td><%= mybook.getClientName() %></td>
                                <td><%= mybook.getVehicleNumber() %></td>
                                <td><%= mybook.getTotalPrice()%></td>

                            </tr>
                            <%
                                }
                            } else {
                            %>
                            <tr>
                                <td colspan="7" class="text-center">No bookings found.</td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>

                    </div>
                    <!-- My HistoryTab -->
                    <div id="my-history" class="tab-content">
                        <h3 class="text-orange mb-4 fw-bold fw-bold">My History</h3>
                        <table class="table table-dark table-striped">
                            <thead>
                                <tr>
                                    <th>Booking ID</th>
                                    <th>Start Location</th>
                                    <th>End Location</th>
                                    <th>Vehicle Type</th>
                                    <th>Vehicle Name</th>
                                    <th>Date & Time</th>
                                    <th>Payment Method</th>
                                </tr>
                            </thead>
                            <tbody>

                             

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const tabs = document.querySelectorAll(".btn-tab");
                const tabContents = document.querySelectorAll(".tab-content");

                tabs.forEach((tab) => {
                    tab.addEventListener("click", (event) => {
                        event.preventDefault();
                        const targetTab = tab.getAttribute("data-tab");
                        tabs.forEach((t) => t.classList.remove("active"));
                        tab.classList.add("active");
                        tabContents.forEach((content) => content.style.display = "none");                 
                        document.getElementById(targetTab).style.display = "block";
                    });
                });

                const defaultTab = document.querySelector(".btn-tab");
                if (defaultTab) {
                    defaultTab.click();
                }
            });
        </script>


    </script>
</body>
</html>