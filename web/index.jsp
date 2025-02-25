<%@page import="src.data.utils.DataLayer"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Database Connection Test</title>
    </head>
    <body>
        <h1>Database Connection Test</h1>
        
        <%
            Connection conn = null;
            try {
                conn = DataLayer.getConnection();
                if (conn != null) {
                    out.println("<p style='color: green;'>✅ Connection successful!</p>");
                } else {
                    out.println("<p style='color: red;'>❌ Connection failed!</p>");
                }
            } catch (Exception e) {
                out.println("<p style='color: red;'>❌ Error: " + e.getMessage() + "</p>");
            } finally {
                if (conn != null) {
                    conn.close();
                }
            }
        %>
    </body>
</html>
