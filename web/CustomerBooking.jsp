<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Booking Portal - Mega City Cabs</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./Styles/style.css">
    </head>
    <body class="booking-portal">

        <header class="text-white py-3">
            <div class="container">
                <div class="d-flex justify-content-between align-items-center">

                    <div class="company-name">
                        <h1 class="h3 mb-0 text-orange fw-bold"><a href="index.jsp" class="header-link">Mega City Cabs</a></h1>
                    </div>

                    <div class="contact-info d-none d-md-block">
                        <p class="mb-0">Welcome <span class="text-orange"> ${sessionScope.user.name}</span></p>
                    </div>
                </div>
            </div>
        </header>

        <div class="container mt-5 w-50 pt-5">
            <ul class="nav nav-tabs" id="bookingTabs">
                <li class="nav-item">
                    <a class="nav-link btn-tab btn btn-orange w-100 active" id="newBookingTab" href="#" onclick="showTab('newBooking')">New Booking</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn-tab btn btn-orange w-100" id="bookingHistoryTab" href="#" onclick="showTab('bookingHistory')">Booking History</a>
                </li>
            </ul>

            <div id="newBooking" class="tab-content mt-3">
                <h2 class="text-orange text-center">New Booking</h2>

                <!-- Step 1: Select Route & Vehicle Type -->
                <form action="booking" method="post">
                    <input type="hidden" name="action" value="step1">
                    <div id="step1" class="booking-step">
                        <div class="mb-3">
                            <h4>Step 1: Select Route & Vehicle Type</h4>
                        </div>
                        <div class="mb-3">
                            <label>Pickup</label>
                            <select id="startLocation" class="form-control" name="startLocation">
                                <option value="Colombo">Colombo</option>
                                <option value="cityB">City B</option>
                                <option value="cityC">City C</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label>Drop</label>
                            <select id="endLocation" class="form-control" name="endLocation">
                                <option value="Gampaha">Gampaha</option>
                                <option value="cityB">City B</option>
                                <option value="cityC">City C</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label>Vehicle Type</label>
                            <select id="vehicleType" class="form-control" name="vehicleType">
                                <option value="sedan">Sedan</option>
                                <option value="suv">SUV</option>
                                <option value="van">Van</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <button type="submit" class="btn btn-orange mt-3">Find</button>
                        </div>
                    </div>
                </form>




                <div id="step2" class="booking-step" style="display: <%= request.getAttribute("vehicleNames") != null ? "block" : "none"%>;">
                    <div class="mb-3">
                        <h4>Step 2: Select Vehicle & Payment</h4>
                    </div>
                    <form action="booking" method="post">
                        <input type="hidden" name="action" value="step2">

                        <!-- Hidden inputs for Step 1 data -->
                        <input type="hidden" name="startLocation" value="<%= request.getParameter("startLocation")%>">
                        <input type="hidden" name="endLocation" value="<%= request.getParameter("endLocation")%>">
                        <input type="hidden" name="vehicleType" value="<%= request.getParameter("vehicleType")%>">

                        <div class="mb-3">
                            <label>Vehicle Name</label>
                            <select id="vehicleName" name="vehicleName" class="form-control">
                                <%

                                    java.util.List<String> vehicleNames = (java.util.List<String>) request.getAttribute("vehicleNames");
                                    if (vehicleNames != null) {
                                        for (String vehicle : vehicleNames) {
                                %>
                                <option value="<%= vehicle%>"><%= vehicle%></option>
                                <%
                                        }
                                    }
                                %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label>Date</label>
                            <input type="date" id="bookingDate" class="form-control" name="bookingDate" required>
                        </div>
                        <div class="mb-3">
                            <label>Time</label>
                            <div class="d-flex">
                                <!-- Hours Dropdown -->
                                <select id="bookingHour" class="form-control me-2" name="bookingHour" required>
                                    <option value="">HH</option>
                                    <% for (int i = 0; i < 24; i++) {%>
                                    <option value="<%= String.format("%02d", i)%>"><%= String.format("%02d", i)%></option>
                                    <% } %>
                                </select>

                                <!-- Minutes Dropdown -->
                                <select id="bookingMinute" class="form-control" name="bookingMinute" required>
                                    <option value="">MM</option>
                                    <% for (int i = 0; i < 60; i++) {%>
                                    <option value="<%= String.format("%02d", i)%>"><%= String.format("%02d", i)%></option>
                                    <% }%>
                                </select>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label>Payment Method</label>
                            <select id="paymentMethod" class="form-control" name="paymentMethod">
                                <option value="creditCard">Credit Card</option>
                                <option value="debitCard">Debit Card</option>
                                <option value="cash">Cash</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <button type="button" class="btn btn-secondary mt-3" onclick="window.location.href = 'CustomerBooking.jsp'">Back</button>
                            <button type="submit" class="btn btn-orange mt-3">Submit</button>
                        </div>
                    </form>
                </div>




            </div>
        </div>
    </body>
</html>