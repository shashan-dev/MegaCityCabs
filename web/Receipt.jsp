<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="src.app.model.Receipt" %> <!-- Replace with your actual package name -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Receipt</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./Styles/style.css">

</head>
<body class="bg-dark">
    
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
    

    <div class="receipt-container">
        <h3 class="text-center mb-4">Booking Receipt</h3>
        <table class="table table-dark table-striped">
            <thead>
                <tr>
                    <th>Order Number</th>
                    <th>Date & Time</th>
                    <th>Customer</th>
                    <th>Pickup Location</th>
                    <th>Drop Location</th>
                    <th>Vehicle Number</th>
                    <th>Vehicle Name</th>
                    <th>Vehicle Type</th>
                    <th>Price Per 1KM</th>
                    <th>Mileage (KM)</th>
                    <th>Total Amount</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<Receipt> recipt = (List<Receipt>) request.getAttribute("receipt");
                    if (recipt != null) {
                        for (Receipt reciptdata : recipt) {
                %>
                            <tr>
                                <td><%= reciptdata.getOrderNumber() %></td>
                                <td><%= reciptdata.getBookingDateTime() %></td>
                                <td><%= reciptdata.getClientName() %></td>
                                <td><%= reciptdata.getStartLocation() %></td>
                                <td><%= reciptdata.getEndLocation() %></td>
                                <td><%= reciptdata.getVehicleNumber() %></td>
                                <td><%= reciptdata.getVehicleName() %></td>
                                <td><%= reciptdata.getVehicleType() %></td>
                                <td><%= reciptdata.getPricePerKm() %></td>
                                <td><%= reciptdata.getKmCount() %></td>
                                <td><%= reciptdata.getTotalPrice() %></td>
                            </tr>
                <%
                        }
                    } else {
                %>
                        <tr>
                            <td colspan="11" class="text-center">No receipts found.</td>
                        </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <hr>
        <div class="text-center">
            <button class="btn btn-primary btn-print" onclick="window.print()">Print</button>
            <a href="index.jsp" class="btn btn-secondary">Home</a>
        </div>
    </div>
            
     <div class="thank-you-message">
    <h3 class="text-center">Thank You for Choosing Us!</h3>
    <p class="text-center">We appreciate your business. If you have any questions, feel free to contact us.</p>
</div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <script>
        document.querySelector('.overlay').addEventListener('click', function() {
            document.querySelector('.overlay').style.display = 'none';
            document.querySelector('.receipt').style.display = 'none';
        });
    </script>
</body>
</html>