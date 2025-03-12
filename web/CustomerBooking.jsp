<%@page import="src.app.model.Receipt"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Booking Portal - Mega City Cabs</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="./Styles/style.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
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
                        <p class="mb-0">Hi, <span class="text-orange">${sessionScope.user.name}</span></p>
                    </div>
                    <a href="LogOutServlt" class="btn btn-orange btn-sm">Logout</a>
                </div>
            </div>
        </header>

        <div class="container mt-5 w-50 pt-5">
            <ul class="nav nav-tabs" id="bookingTabs" role="tablist">
                <li class="nav-item" role="presentation">
                    <a class="nav-link active" id="newBookingTab" data-bs-toggle="tab" href="#newBooking" role="tab" aria-selected="true">New Booking</a>
                </li>
                <li class="nav-item" role="presentation">
                    <a class="nav-link" id="bookingHistoryTab" data-bs-toggle="tab" href="#bookingHistory" role="tab" aria-selected="false">Booking History</a>
                </li>
            </ul>

            <div class="tab-content mt-3">
                <!-- New Booking Tab -->
                <div class="tab-pane fade show active" id="newBooking" role="tabpanel">
                    <h2 class="text-orange text-center">New Booking</h2>
                    <form action="booking" method="post">
                        <input type="hidden" name="action" value="step1">
                        <div class="mb-3">
                            <h4>Step 1: Select Route & Vehicle Type</h4>
                        </div>

                        <div class="mb-3">
                            <label>Pickup</label>
                            <select id="startLocation" class="form-control" name="startLocation">

                                <option value="">-- Select City --</option>
                                <% List<String> cities = (List<String>) request.getAttribute("cities");
                                    if (cities != null) {
                                        for (String city : cities) {%>
                                <option value="<%= city%>"><%= city%></option>
                                <% }
                                    } %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label>Drop</label>
                            <select id="endLocation" class="form-control" name="endLocation">
                                <option value="">-- Select City --</option>
                                <% List<String> dropCities = (List<String>) request.getAttribute("Dropcities");
                                    if (dropCities != null) {
                                        for (String dropCity : dropCities) {%>
                                <option value="<%= dropCity%>"><%= dropCity%></option>
                                <% }
                                    } %>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label>Vehicle Type</label>
                            <select id="vehicleType" class="form-control" name="vehicleType">
                                <option value="">-- Select Vehicle Type --</option>
                                <% List<String> vehicles = (List<String>) request.getAttribute("vehicleTypes");
                                    if (vehicles != null) {
                                        for (String vehicle : vehicles) {%>
                                <option value="<%= vehicle%>"><%= vehicle%></option>
                                <% }
                                    }%>
                            </select>
                        </div>
                        <button type="submit" class="btn btn-orange mt-3">Find</button>
                    </form>
                </div>
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
                            <input type="hidden" name="userName" value="${sessionScope.user.name}">
                            <button type="button" class="btn btn-secondary mt-3" onclick="window.location.href = 'booking'">Back</button>
                            <button type="submit" class="btn btn-orange mt-3">Submit</button>
                        </div>
                    </form>
                </div>


                <!-- Booking History Tab -->
                <div class="tab-pane fade" id="bookingHistory" role="tabpanel">
                    <h2 class="text-orange text-center">Booking History</h2>
                    <div class="mb-3">
                        <input type="text" id="orderNoFilter" class="form-control" placeholder="Search by Order Number">
                        </div>
                    <table class="table table-bordered text-white">
                        <thead>
                            <tr>
                                <th>Order No</th>
                                <th>Date & Time</th>
                                <th>Pickup Location</th>
                                <th>Drop Location</th>
                                <th>Vehicle Name</th>
                                <th>Mileage (KM)</th>
                                <th>Amount</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Receipt> myBooking = (List<Receipt>) request.getAttribute("myBooking");
                                if (myBooking != null) {
                                    for (Receipt mybook : myBooking) {

                            %>
                            <tr>
                                <td class="orderNo"><%= mybook.getOrderNumber()%></td>
                                <td><%= mybook.getBookingDateTime()%></td>
                                <td><%= mybook.getStartLocation()%></td>
                                <td><%= mybook.getEndLocation()%></td>
                                <td><%= mybook.getVehicleName()%></td>
                                <td><%= mybook.getKmCount()%></td>
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
            </div>
        </div>

                           
<script>
       document.getElementById("orderNoFilter").addEventListener("input", function () {
      
        const filterValue = this.value.toLowerCase();

        const rows = document.querySelectorAll("table tbody tr");

        rows.forEach(row => {
            const orderNoCell = row.querySelector(".orderNo");
            if (orderNoCell) {
                const orderNo = orderNoCell.textContent.toLowerCase();
                if (orderNo.includes(filterValue)) {
                    row.style.display = ""; 
                } else {
                    row.style.display = "none"; 
                }
            }
        });
    });
 </script>
    </body>
</html>
