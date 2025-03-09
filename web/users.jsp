<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Booking Form</title>
    <style>
        .booking-step {
            display: none;
        }
        .booking-step.active {
            display: block;
        }
    </style>
    <script>
        // Function to switch between steps
        function nextStep(step) {
            if (step === 2) {
                // Fetch vehicle names dynamically using AJAX
                const startLocation = document.getElementById("startLocation").value;
                const vehicleType = document.getElementById("vehicleType").value;

                fetch(`/getVehicleNames?startLocation=${startLocation}&vehicleType=${vehicleType}`)
                    .then(response => response.json())
                    .then(data => {
                        // Populate the vehicleName dropdown
                        const vehicleNameSelect = document.getElementById("vehicleName");
                        vehicleNameSelect.innerHTML = ""; // Clear existing options
                        data.forEach(vehicle => {
                            const option = document.createElement("option");
                            option.value = vehicle;
                            option.textContent = vehicle;
                            vehicleNameSelect.appendChild(option);
                        });

                        // Show step 2 and hide step 1
                        document.getElementById("step1").classList.remove("active");
                        document.getElementById("step2").classList.add("active");
                    })
                    .catch(error => console.error("Error fetching vehicle names:", error));
            }
        }

        function prevStep(step) {
            if (step === 1) {
                // Show step 1 and hide step 2
                document.getElementById("step2").classList.remove("active");
                document.getElementById("step1").classList.add("active");
            }
        }

        // Function to submit the booking form
        function submitBookingForm() {
            const form = document.getElementById("step2Form");
            const formData = new FormData(form);

            fetch("/booking", {
                method: "POST",
                body: formData
            })
            .then(response => {
                if (response.ok) {
                    window.location.href = "success.jsp"; // Redirect to success page
                } else {
                    window.location.href = "error.jsp?message=booking_failed"; // Redirect to error page
                }
            })
            .catch(error => {
                console.error("Error submitting booking:", error);
                window.location.href = "error.jsp?message=network_error";
            });
        }
    </script>
</head>
<body>
    <div id="newBooking" class="tab-content mt-3">
        <h2 class="text-orange text-center">New Booking</h2>

        <!-- Step 1: Select Route & Vehicle Type -->
        <div id="step1" class="booking-step active">
            <div class="mb-3">
                <h4>Step 1: Select Route & Vehicle Type</h4>
            </div>
            <form id="step1Form">
                <div class="mb-3">
                    <label>Pickup</label>
                    <select id="startLocation" name="startLocation" class="form-control">
                        <option value="cityA">City A</option>
                        <option value="cityB">City B</option>
                        <option value="cityC">City C</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label>Drop</label>
                    <select id="endLocation" name="endLocation" class="form-control">
                        <option value="cityA">City A</option>
                        <option value="cityB">City B</option>
                        <option value="cityC">City C</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label>Vehicle Type</label>
                    <select id="vehicleType" name="vehicleType" class="form-control">
                        <option value="sedan">Sedan</option>
                        <option value="suv">SUV</option>
                        <option value="van">Van</option>
                    </select>
                </div>
                <div class="mb-3">
                    <button type="button" class="btn btn-orange mt-3" onclick="nextStep(2)">Next</button>
                </div>
            </form>
        </div>

        <!-- Step 2: Select Vehicle & Payment -->
        <div id="step2" class="booking-step">
            <div class="mb-3">
                <h4>Step 2: Select Vehicle & Payment</h4>
            </div>
            <form id="step2Form">
                <input type="hidden" name="action" value="step2">
                <div class="mb-3">
                    <label>Vehicle Name</label>
                    <select id="vehicleName" name="vehicleName" class="form-control">
                        <!-- Vehicle options will be populated dynamically -->
                    </select>
                </div>
                <div class="mb-3">
                    <label>Date & Time</label>
                    <input type="datetime-local" id="bookingDateTime" name="bookingDateTime" class="form-control">
                </div>
                <div class="mb-3">
                    <label>Payment Method</label>
                    <select id="paymentMethod" name="paymentMethod" class="form-control">
                        <option value="creditCard">Credit Card</option>
                        <option value="debitCard">Debit Card</option>
                        <option value="cash">Cash</option>
                    </select>
                </div>
                <div class="mb-3">
                    <button type="button" class="btn btn-secondary mt-3" onclick="prevStep(1)">Back</button>
                    <button type="button" class="btn btn-orange mt-3" onclick="submitBookingForm()">Submit</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>