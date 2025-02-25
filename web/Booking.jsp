<%-- 
    Document   : Booking
    Created on : 22 Feb 2025, 21:13:02
    Author     : Shashan(ShashanPrabo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="BookingController" method="post">
    Name: <input type="text" name="name"><br>
    Address: <input type="text" name="address"><br>
    NIC: <input type="text" name="nic"><br>
    Phone: <input type="text" name="phone"><br>
    <input type="submit" value="Book Now">
</form>

    </body>
</html>
