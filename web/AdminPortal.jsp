<%-- 
    Document   : AdminPortal
    Created on : 26 Feb 2025, 22:36:51
    Author     : Shashan(ShashanPrabo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Portal - Mega City Cabs</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom CSS -->
  <link rel="stylesheet" href="./Styles/style.css">
</head>
<body class="admin-portal">
    <header class="text-white py-3">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <!-- Company Name -->
                <div class="company-name">
                    <h1 class="h3 mb-0 text-orange fw-bold"><a href="index.jsp" class="header-link">Mega City Cabs</a></h1>
                </div>

                <!-- Contact Info -->
                <div class="contact-info d-none d-md-block">
                    <p class="mb-0">Welocme <span class="text-orange">Admin!</span></p>
                </div>
            </div>
        </div>
    </header>

  <div class="container-fluid">
    <div class="row vh-100">
      <!-- Sidebar for Tabs -->
      <div class="col-md-3 col-lg-2 bg-dark text-white sidebar mt-5">
        <h2 class="text-center text-orange py-4 fw-bold pt-4">Admin Portal</h2>
        <ul class="nav flex-column">
          <li class="nav-item">
            <button class="nav-link btn-tab  btn btn-orange w-100 active" data-tab="reservations">Reservations</button>
          </li>
          <li class="nav-item mt-2">
            <button class="nav-link btn-tab btn btn-orange w-100" data-tab="vehicle-allocation">Vehicle Allocation</button>
          </li>
          <li class="nav-item mt-2">
            <button class="nav-link btn-tab btn btn-orange w-100" data-tab="vehicle-management">Vehicle Management</button>
          </li>
          <li class="nav-item mt-2">
            <button class="nav-link btn-tab btn btn-orange w-100" data-tab="user-management">User Management</button>
          </li>
        </ul>
      </div>

      <!-- Main Content -->
      <div class="col-md-9 col-lg-10 main-content  mt-5">
          <hr>
        <!-- Reservations Tab -->
        <div id="reservations" class="tab-content active">
          <h3 class="text-orange mb-4 fw-bold" >Reservations</h3>
          <table class="table table-dark table-striped">
            <thead>
              <tr>
                <th>Trip ID</th>
                <th>Customer Name</th>
                <th>Pickup Location</th>
                <th>Destination</th>
                <th>Date</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>001</td>
                <td>John Doe</td>
                <td>City A</td>
                <td>City B</td>
                <td>2023-10-01</td>
                <td>Completed</td>
              </tr>
              <!-- Add more rows dynamically -->
            </tbody>
          </table>
        </div>

        <!-- Vehicle Allocation Tab -->
        <div id="vehicle-allocation" class="tab-content">
          <h3 class="text-orange mb-4 fw-bold fw-bold">Vehicle Allocation</h3>
          <div class="row">
            <div class="col-md-6">
              <h4 class="text-orange">Add New Allocation</h4>
              <form id="addAllocationForm">
                <div class="mb-3">
                  <label for="vehicleType" class="form-label">Vehicle Type</label>
                  <select class="form-control" id="vehicleType" required>
                    <option value="sedan">Sedan</option>
                    <option value="suv">SUV</option>
                    <option value="van">Van</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="vehicleName" class="form-label">Vehicle Name</label>
                  <input type="text" class="form-control" id="vehicleName" required>
                </div>
                <div class="mb-3">
                  <label for="vehicleNumber" class="form-label">Vehicle Number</label>
                  <input type="text" class="form-control" id="vehicleNumber" required>
                </div>
                <div class="mb-3">
                  <label for="driverId" class="form-label">Driver Employee ID</label>
                  <input type="text" class="form-control" id="driverId" required>
                </div>
                <div class="mb-3">
                  <label for="city" class="form-label">City</label>
                  <input type="text" class="form-control" id="city" required>
                </div>
                <button type="submit" class="btn btn-orange">Add Allocation</button>
              </form>
            </div>
            <div class="col-md-6">
              <h4 class="text-orange">Deactivate Allocations</h4>
              <table class="table table-dark table-striped">
                <thead>
                  <tr>
                    <th>Allocation ID</th>
                    <th>Vehicle Name</th>
                    <th>Driver ID</th>
                    <th>City</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>001</td>
                    <td>Sedan 1</td>
                    <td>D001</td>
                    <td>City A</td>
                    <td><input type="checkbox" checked data-toggle="toggle"></td>
                  </tr>
                  <!-- Add more rows dynamically -->
                </tbody>
              </table>
            </div>
          </div>
        </div>

        <!-- Vehicle Management Tab -->
        <div id="vehicle-management" class="tab-content">
          <h3 class="text-orange mb-4 fw-bold">Vehicle Management</h3>
          <div class="row">
            <div class="col-md-6">
              <h4 class="text-orange">Add New Vehicle</h4>
              <form id="addVehicleForm">
                <div class="mb-3">
                  <label for="vehicleType" class="form-label">Vehicle Type</label>
                  <select class="form-control" id="vehicleType" required>
                    <option value="sedan">Sedan</option>
                    <option value="suv">SUV</option>
                    <option value="van">Van</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="vehicleName" class="form-label">Vehicle Name</label>
                  <input type="text" class="form-control" id="vehicleName" required>
                </div>
                <div class="mb-3">
                  <label for="vehicleNumber" class="form-label">Vehicle Number</label>
                  <input type="text" class="form-control" id="vehicleNumber" required>
                </div>
                <div class="mb-3">
                  <label for="ownerName" class="form-label">Owner Name</label>
                  <input type="text" class="form-control" id="ownerName" required>
                </div>
                <div class="mb-3">
                  <label for="ownerContact" class="form-label">Owner Contact Number</label>
                  <input type="tel" class="form-control" id="ownerContact" required>
                </div>
                <button type="submit" class="btn btn-orange">Add Vehicle</button>
              </form>
            </div>
            <div class="col-md-6">
              <h4 class="text-orange">Edit Vehicle</h4>
              <form id="editVehicleForm">
                <div class="mb-3">
                  <label for="vehicleType" class="form-label">Vehicle Type</label>
                  <select class="form-control" id="vehicleType" required>
                    <option value="sedan">Sedan</option>
                    <option value="suv">SUV</option>
                    <option value="van">Van</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="vehicleName" class="form-label">Vehicle Name</label>
                  <input type="text" class="form-control" id="vehicleName" required>
                </div>
                <div class="mb-3">
                  <label for="vehicleNumber" class="form-label">Vehicle Number</label>
                  <input type="text" class="form-control" id="vehicleNumber" required>
                </div>
                <div class="mb-3">
                  <label for="ownerName" class="form-label">Owner Name</label>
                  <input type="text" class="form-control" id="ownerName" required>
                </div>
                <div class="mb-3">
                  <label for="ownerContact" class="form-label">Owner Contact Number</label>
                  <input type="tel" class="form-control" id="ownerContact" required>
                </div>
                <button type="submit" class="btn btn-orange">Update Vehicle</button>
              </form>
               </div>
              <div class="mb-3 mt-4">
              <h4 class="text-orange">All Vehicles</h4>
              <table class="table table-dark table-striped">
                <thead>
                  <tr>
                    <th>Vehicle ID</th>
                    <th>Vehicle Name</th>
                    <th>Owner Name</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>001</td>
                    <td>Sedan 1</td>
                    <td>John Doe</td>
                    <td>Active</td>
                    <td><button class="btn btn-sm btn-orange">Edit</button></td>
                  </tr>
                  <!-- Add more rows dynamically -->
                </tbody>
              </table>
              </div>
          </div>
        </div>

        <!-- User Management Tab -->
        <div id="user-management" class="tab-content">
          <h3 class="text-orange mb-4 fw-bold">User Management</h3>
          <div class="row">
            <div class="col-md-6">
              <h4 class="text-orange">Add New User</h4>
              <form id="addUserForm">
                <div class="mb-3">
                  <label for="userRole" class="form-label">User Role</label>
                  <select class="form-control" id="userRole" required>
                    <option value="admin">Admin</option>
                    <option value="driver">Driver</option>
                    <option value="customer">Customer</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="userName" class="form-label">Name</label>
                  <input type="text" class="form-control" id="userName" required>
                </div>
                <div class="mb-3">
                  <label for="userNIC" class="form-label">NIC</label>
                  <input type="text" class="form-control" id="userNIC" required>
                </div>
                <div class="mb-3">
                  <label for="userPassword" class="form-label">Password</label>
                  <input type="password" class="form-control" id="userPassword" required>
                </div>
                <div class="mb-3">
                  <label for="userContact" class="form-label">Contact Number</label>
                  <input type="tel" class="form-control" id="userContact" required>
                </div>
                <button type="submit" class="btn btn-orange">Add User</button>
              </form>
            </div>
            <div class="col-md-6">
              <h4 class="text-orange">Edit User</h4>
              <table class="table table-dark table-striped">
                <thead>
                  <tr>
                    <th>User ID</th>
                    <th>Name</th>
                    <th>Role</th>
                    <th>Status</th>
                    <th>Action</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>001</td>
                    <td>John Doe</td>
                    <td>Admin</td>
                    <td>Active</td>
                    <td><button class="btn btn-sm btn-orange">Edit</button></td>
                  </tr>
                  <!-- Add more rows dynamically -->
                </tbody>
              </table>
            </div>
          </div>
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
    tab.addEventListener("click", () => {
      const targetTab = tab.getAttribute("data-tab");

      // Remove active class from all tabs
      tabs.forEach((t) => t.classList.remove("active"));
      tab.classList.add("active");

      // Hide all tab contents
      tabContents.forEach((content) => {
        content.style.display = "none";
      });

      // Show the selected tab content
      document.getElementById(targetTab).style.display = "block";
    });
  });

  // Set the initial active tab (default to Reservations)
  document.querySelector(".btn-tab.active")?.click();
});

</script>
</body>
</html>