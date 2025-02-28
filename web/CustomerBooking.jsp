<%-- 
    Document   : CustomerBooking
    Created on : 28 Feb 2025, 21:08:17
    Author     : Shashan(ShashanPrabo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Booking Portal - Mega City Cabs</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom CSS -->
  <link rel="stylesheet" href="./Styles/style.css">
</head>
<body class="booking-portal">
      <header class="text-white py-3">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <!-- Company Name -->
                <div class="company-name">
                    <h1 class="h3 mb-0 text-orange fw-bold"><a href="index.jsp" class="header-link">Mega City Cabs</a></h1>
                </div>

                <!-- Contact Info -->
                <div class="contact-info d-none d-md-block">
                    <p class="mb-0">Welocme <span class="text-orange">Customer 1!</span></p>
                </div>
            </div>
        </div>
    </header>
    
  <div class="container-fluid">
    <div class="row vh-100">
      <!-- Sidebar for Tabs -->
      <div class="col-md-3 col-lg-2 bg-dark text-white sidebar mt-5">
        <h2 class="text-center text-orange py-4 fw-bold pt-4" >Booking Portal</h2>
       <ul class="nav flex-column">
  <li class="nav-item">
    <a href="#" class="nav-link btn-tab  btn btn-orange w-100 active" data-tab="new-booking">New Booking</a>
  </li>
  <li class="nav-item">
    <a href="#" class="nav-link btn-tab  btn btn-orange w-100" data-tab="my-bookings">My Bookings</a>
  </li>
</ul>

      </div>

      <!-- Main Content -->
      <div class="col-md-9 col-lg-10 main-content mt-5 ">
          <hr>
        <!-- New Booking Tab -->
        <div id="new-booking" class="tab-content active">
          <h3 class="text-orange mb-4 fw-bold">New Booking</h3>
          <form id="bookingForm">
            <!-- Start Location -->
            <div class="mb-3">
              <label for="startLocation" class="form-label">Start Location</label>
              <select class="form-control" id="startLocation" required>
                <option value="cityA">City A</option>
                <option value="cityB">City B</option>
                <option value="cityC">City C</option>
              </select>
            </div>

            <!-- End Location -->
            <div class="mb-3">
              <label for="endLocation" class="form-label">End Location</label>
              <select class="form-control" id="endLocation" required>
                <option value="cityA">City A</option>
                <option value="cityB">City B</option>
                <option value="cityC">City C</option>
              </select>
            </div>

            <!-- Vehicle Type -->
            <div class="mb-3">
              <label for="vehicleType" class="form-label">Vehicle Type</label>
              <select class="form-control" id="vehicleType" required>
                <option value="sedan">Sedan</option>
                <option value="suv">SUV</option>
                <option value="van">Van</option>
              </select>
            </div>

            <!-- Vehicle Name -->
            <div class="mb-3">
              <label for="vehicleName" class="form-label">Vehicle Name</label>
              <select class="form-control" id="vehicleName" required>
                <option value="sedan1">Sedan 1</option>
                <option value="suv1">SUV 1</option>
                <option value="van1">Van 1</option>
              </select>
            </div>

            <!-- Date and Time -->
            <div class="mb-3">
              <label for="bookingDateTime" class="form-label">Date & Time</label>
              <input type="datetime-local" class="form-control" id="bookingDateTime" required>
            </div>

            <!-- Payment Method -->
            <div class="mb-3">
              <label for="paymentMethod" class="form-label">Payment Method</label>
              <select class="form-control" id="paymentMethod" required>
                <option value="creditCard">Credit Card</option>
                <option value="debitCard">Debit Card</option>
                <option value="cash">Cash</option>
              </select>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="btn btn-orange">Book Now</button>
          </form>

          <!-- Bill Summary -->
     
          <div id="billSummary" class="mt-4" style="display: None">
            <h4 class="text-orange">Receipt</h4>
            <table class="table table-dark table-striped">
              <thead>
                <tr>
                  <th>Item</th>
                  <th>Details</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Start Location</td>
                  <td id="billStartLocation"></td>
                </tr>
                <tr>
                  <td>End Location</td>
                  <td id="billEndLocation"></td>
                </tr>
                <tr>
                  <td>Vehicle Type</td>
                  <td id="billVehicleType"></td>
                </tr>
                <tr>
                  <td>Vehicle Name</td>
                  <td id="billVehicleName"></td>
                </tr>
                <tr>
                  <td>Date & Time</td>
                  <td id="billDateTime"></td>
                </tr>
                <tr>
                  <td>Payment Method</td>
                  <td id="billPaymentMethod"></td>
                </tr>
              </tbody>
            </table>
            <button class="btn btn-orange" onclick="window.print()">Print Bill</button>
          </div>
        </div>

        <!-- My Bookings Tab -->
        <div id="my-bookings" class="tab-content">
          <h3 class="text-orange mb-4 fw-bold fw-bold">My Bookings</h3>
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
              <!-- Example Row -->
              <tr>
                <td>001</td>
                <td>City A</td>
                <td>City B</td>
                <td>Sedan</td>
                <td>Sedan 1</td>
                <td>2023-10-01 10:00</td>
                <td>Credit Card</td>
              </tr>
              <!-- Add more rows dynamically -->
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
  <!-- Custom JS -->
  <script>
 
document.addEventListener("DOMContentLoaded", function () {
    const tabs = document.querySelectorAll(".btn-tab");
    const tabContents = document.querySelectorAll(".tab-content");

    tabs.forEach((tab) => {
        tab.addEventListener("click", (event) => {
            event.preventDefault(); // Prevent default anchor behavior

            const targetTab = tab.getAttribute("data-tab");

            // Remove active class from all tabs
            tabs.forEach((t) => t.classList.remove("active"));
            tab.classList.add("active");

            // Hide all tab contents
            tabContents.forEach((content) => content.style.display = "none");

            // Show the selected tab content
            document.getElementById(targetTab).style.display = "block";
        });
    });

    // Set the default active tab
    const defaultTab = document.querySelector(".btn-tab");
    if (defaultTab) {
        defaultTab.click();
    }
});
</script>


  </script>
</body>
</html>