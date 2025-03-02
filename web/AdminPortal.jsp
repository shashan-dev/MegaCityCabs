<%-- 
    Document   : AdminPortal
    Created on : 26 Feb 2025, 22:36:51
    Author     : Shashan(ShashanPrabo
--%>

<%@page import="src.app.model.Vehicle"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="src.app.model.User"%>




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
        <%
                String registrationStatus = request.getParameter("status");
                if (registrationStatus != null && registrationStatus.contains("success")) {
            %>
                <div class="notification alert alert-success alert-dismissible fade show small-alert" role="alert">
                    <strong >Success!</strong> Your action was completed successfully.
                   <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
               </div>
           <%
                }
                    else if(registrationStatus != null && registrationStatus.contains("failed")){
            %>
                <div class="notification alert alert-danger alert-dismissible fade show small-alert-error" role="alert">
                    <strong >Error!</strong> Your action was falied. Please try again.
                   <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
               </div>
           <%
                }
            %>
           

  <div class="container-fluid">
    <div class="row vh-100">
      <!-- Sidebar for Tabs -->
      <div class="col-md-3 col-lg-2 bg-dark text-white sidebar mt-5">
        <h2 class="text-center text-orange py-4 fw-bold ">Admin Portal</h2>
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
              
              
              <form id="addAllocationForm" action="VehicleAllocationServlt" method="POST">
                  <div class="mb-3">
                      <label for="alloVehicleNumber" class="form-label">Vehicle </label > <label class="text-secondary font-italic">(Vehicle Numer : Vehicle Name : Vehicle Type)</label>
                  <select class="form-control" id="alloVehicleNumber"  name="alloVehicleNumber" required>
                    <option value="">-- Select Vehicle Number --</option>
                    <%
                        List<String> vehicleNo = (List<String>) request.getAttribute("vehicleNo");
                        if (vehicleNo != null) {
                            for (String vno : vehicleNo) {
                    %>
                                <option value="<%= vno %>"><%= vno %></option>
                    <%
                            }
                        }
                    %>
                  </select>
                </div>
                  <div class="mb-3">
                  <label for="driverId" class="form-label">Driver</label> <label class="text-secondary font-italic">(Driver Numer : Driver Name)</label>
                  <select class="form-control" id="driverId" name="driverId"  required>
                    <option value="">-- Select Driver --</option>
                    <%
                        List<String> drivers = (List<String>) request.getAttribute("drivers");
                        if (drivers != null) {
                            for (String driverId : drivers) {
                    %>
                                <option value="<%= driverId %>"><%= driverId %></option>
                    <%
                            }
                        }
                    %>
                  </select>
                </div>
                   <div class="mb-3">
                    <label for="city" class="form-label">City</label>
                    <select class="form-control" id="city" name="city" required>
                    <option value="">-- Select City --</option>
                    <%
                        List<String> cities = (List<String>) request.getAttribute("cities");
                        if (cities != null) {
                            for (String city : cities) {
                    %>
                                <option value="<%= city %>"><%= city %></option>
                    <%
                            }
                        }
                    %>
                    </select>
                     </div>
                    <div class="mb-3">
                  <label for="vehiclePrice" class="form-label">Price (Per 1KM)</label>
                  <input type="text" class="form-control" id="vehiclePrice" name="vehiclePrice" required>
                </div>
                <button type="submit" class="btn btn-orange">Add Allocation</button>
              </form>
                    
            </div>
            <div class="col-md-6">
              <h4 class="text-orange">Deactivate Allocations</h4>
              <table class="table table-dark table-striped">
                <thead>
                  <tr>
                    <th>Vehicle Type</th>
                    <th>Vehicle Number</th>
                    <th>Vehicle Name</th>
                    <th>Driver Emp ID</th>
                    <th>Driver Name</th>
                     <th>City</th>
                      <th>Price (per 1KM)</th>
                  </tr>
                </thead>
               <tbody>
                            <%
                                List<Vehicle> vehicleallocation = (List<Vehicle>) request.getAttribute("vehicleAllocation");
                                if (vehicleallocation != null) {
                                    for (Vehicle vehicle : vehicleallocation) {
                                        
                            %>
                                        <tr>
                                            <td><%= vehicle.getVehicleType()%></td>
                                            <td><%= vehicle.getVehicleNumber()%></td>
                                            <td><%= vehicle.getVehicleName()%></td>
                                            <td><%= vehicle.getDriverId()%></td>
                                            <td><%= vehicle.getDrivrName()%></td>
                                            <td><%= vehicle.getCity()%></td>
                                            <td><%= vehicle.getPrice()%></td>

                                        </tr>
                            <%
                                    }
                                } else {
                            %>
                                    <tr>
                                        <td colspan="3" class="text-center">No users found.</td>
                                    </tr>
                            <%
                                }
                            %>
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
              <form id="vehicleRegistrationForm" action="VehicleRegistrationServlet" method="POST">
                <div class="mb-3">
                  <label for="vehicleType" class="form-label">Vehicle Type</label>
                  <select class="form-control" id="vehicleType" name="vehicleType" required>
                    <option value="car">Car</option>
                    <option value="van">Van</option>
                    <option value="suv">SUV</option>
                    <option value="bus">BUS</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="vehicleName" class="form-label">Vehicle Name</label>
                  <input type="text" class="form-control" id="vehicleName" name="vehicleName" required>
                </div>
                <div class="mb-3">
                  <label for="vehicleNumber" class="form-label">Vehicle Number</label>
                  <input type="text" class="form-control" id="vehicleNumber" name="vehicleNumber" required>
                </div>
                <div class="mb-3">
                  <label for="ownerName" class="form-label">Owner Name</label>
                  <input type="text" class="form-control" id="ownerName" name="ownerName" required>
                </div>
                <div class="mb-3">
                  <label for="ownerContact" class="form-label">Owner Contact Number</label>
                  <input type="tel" class="form-control" id="ownerContact" name="ownerContact" required>
                </div>
                <button type="submit" class="btn btn-orange">Add Vehicle</button>
              </form>
            
            </div>
            <div class="col-md-6">
              <h4 class="text-orange">Edit Vehicle</h4>
              <form id="editVehicleForm">
                <div class="mb-3">
                  <label for="editVehicleType" class="form-label">Vehicle Type</label>
                  <select class="form-control" id="editVehicleType" required>
                    <option value="sedan">Sedan</option>
                    <option value="suv">SUV</option>
                    <option value="van">Van</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="editVehicleName" class="form-label">Vehicle Name</label>
                  <input type="text" class="form-control" id="editVehicleName" required>
                </div>
                <div class="mb-3">
                  <label for="editVehicleNumber" class="form-label">Vehicle Number</label>
                  <input type="text" class="form-control" id="editVehicleNumber" required>
                </div>
                <div class="mb-3">
                  <label for="editOwnerName" class="form-label">Owner Name</label>
                  <input type="text" class="form-control" id="editOwnerName" required>
                </div>
                <div class="mb-3">
                  <label for="editOwnerContact" class="form-label">Owner Contact Number</label>
                  <input type="tel" class="form-control" id="editOwnerContact" required>
                </div>
                <button type="submit" class="btn btn-orange">Update Vehicle</button>
              </form>
               </div>
              <div class="mb-3 mt-4">
              <h4 class="text-orange">All Vehicles</h4>
              
              <table class="table table-dark table-striped">
                <thead>
                  <tr>
                    <th>Vehicle Number</th>
                    <th>Vehicle Name</th>
                    <th>Vehicle Type</th>
                    <th>Owner Name</th>
                    <th>Owner Contact</th>
                  </tr>
                </thead>
                <tbody>
                            <%
                                List<Vehicle> vehicles = (List<Vehicle>) request.getAttribute("vehicles");
                                if (vehicles != null) {
                                    for (Vehicle vehicle : vehicles) {
                                        
                            %>
                                        <tr>
                                            <td><%= vehicle.getVehicleNumber() %></td>
                                            <td><%= vehicle.getVehicleName() %></td>
                                            <td><%= vehicle.getVehicleType() %></td>
                                            <td><%= vehicle.getOwnerName() %></td>
                                            <td><%= vehicle.getOwnerContact() %></td>

                                        </tr>
                            <%
                                    }
                                } else {
                            %>
                                    <tr>
                                        <td colspan="5" class="text-center">No vehicles found.</td>
                                    </tr>
                            <%
                                }
                            %>
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
              <form id="addUserForm" action="UserRegistrationServlet" method="POST">
                <div class="mb-3">
                  <label for="userRole" class="form-label">User Role</label>
                  <select class="form-control" id="userRole" name="userRole" required>
                    <option value="admin">Admin</option>
                    <option value="driver">Driver</option>
                  </select>
                </div>
                <div class="mb-3">
                  <label for="userName" class="form-label">Name</label>
                  <input type="text" class="form-control" id="userName" name="userName" required>
                </div>
                <div class="mb-3">
                  <label for="userNIC" class="form-label">NIC</label>
                  <input type="text" class="form-control" id="userNIC" name="userNIC" required>
                </div>
                 <div class="mb-3">
                  <label for="userContact" class="form-label">Contact Number</label>
                  <input type="tel" class="form-control" id="userContact" name="userContact" required>
                </div>
                <div class="mb-3">
                  <label for="userPassword" class="form-label">Password</label>
                  <input type="password" class="form-control" id="userPassword" name="userPassword" required>
                </div>
                <button type="submit" class="btn btn-orange">Add User</button>
              </form>
            </div>
              
            <div class="col-md-6">
              <h4 class="text-orange">Edit User</h4>
            <table border="1" class="table table-dark table-striped">
                        <thead>
                            <tr>
                                <th>Emp ID</th>
                                <th>Name</th>
                                <th>Role</th>
                                <th>NIC</th>
                                 <th>Contact No</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<User> users = (List<User>) request.getAttribute("users");
                                if (users != null) {
                                    for (User user : users) {
                                        System.out.println("users.jsp: Displaying user - " + user.getUserName());
                            %>
                                        <tr>
                                            <td><%= user.getUserId()%></td>
                                            <td><%= user.getUserName() %></td>
                                            <td><%= user.getUserRole() %></td>
                                            <td><%= user.getUserNIC() %></td>
                                            <td><%= user.getUserContact() %></td>

                                        </tr>
                            <%
                                    }
                                } else {
                            %>
                                    <tr>
                                        <td colspan="3" class="text-center">No users found.</td>
                                    </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>  
            
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
    


  
  
  
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