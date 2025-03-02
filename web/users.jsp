<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vehicle Allocation</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-4">
        <h2 class="text-center mb-4">Vehicle Allocation</h2>
        <form id="addAllocationForm" action="allocateVehicle" method="POST">
            <div class="mb-3">
                <label for="alloVehicleType" class="form-label">Vehicle Type</label>
                <select class="form-control" id="alloVehicleType" name="alloVehicleType" required>
                    <option value="">-- Select Vehicle Type --</option>
                    <option value="van">van</option>
                    <%
                        List<String> vehicleTypes = (List<String>) request.getAttribute("vehicleTypes");
                        if (vehicleTypes != null) {
                            for (String type : vehicleTypes) {
                    %>
                                <option value="<%= type %>"><%= type %></option>
                    <%
                            }
                        }
                    %>
                </select>
            </div>
            <div class="mb-3">
                <label for="alloVehicleNumber" class="form-label">Vehicle Number</label>
                <select class="form-control" id="alloVehicleNumber" name="alloVehicleNumber" required>
                    <option value="">-- Select Vehicle Number --</option>
                </select>
            </div>
            <div class="mb-3">
                <label for="driverId" class="form-label">Driver</label>
                <select class="form-control" id="driverId" name="driverId" required>
                    <option value="">-- Select Driver --</option>
                    <%
                        List<String> drivers = (List<String>) request.getAttribute("drivers");
                        if (drivers != null) {
                            for (String driver : drivers) {
                    %>
                                <option value="<%= driver %>"><%= driver %></option>
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
            <button type="submit" class="btn btn-orange">Add Allocation</button>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- JavaScript to filter vehicle numbers -->
    <script>
        document.getElementById("alloVehicleType").addEventListener("change", function () {
            const vehicleType = this.value;
            const vehicleNumberDropdown = document.getElementById("alloVehicleNumber");

            // Clear existing options
            vehicleNumberDropdown.innerHTML = '<option value="">-- Select Vehicle Number --</option>';

            if (vehicleType) {
                // Fetch vehicle numbers for the selected type
                fetch(`/MegaCityCabsReservation/admin?vehicleType=${vehicleType}`)
                    .then(response => response.json())
                    .then(data => {
                        data.forEach(vehicleNumber => {
                            const option = document.createElement("option");
                            option.value = vehicleNumber;
                            option.textContent = vehicleNumber;
                            vehicleNumberDropdown.appendChild(option);
                        });
                    });
            }
        });
    </script>
</body>
</html>