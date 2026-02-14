<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.seniorcitizen.webpro.DBConnection" %>
<%@ page import="com.seniorcitizen.webpro.GetSet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Your Alerts</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            padding: 30px;
            background: url('images/24.jpg') no-repeat center center fixed;
    background-size: cover;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            background-color: white;
            box-shadow: 0 0 10px #ccc;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: center;
        }
        th {
            background-color: #7a5df5;
            color: white;
        }
        tr:hover {
            background-color: #f2f2f2;
        }
          .back-btn {
  display: inline-block;
  background-color: #4b3c80;
  color: white;
  padding: 10px 20px;
  border-radius: 30px;
  text-decoration: none;
  font-size: 14px;
  font-weight: 500;
  transition: background-color 0.3s ease;
  margin-top: 20px;
}

.back-btn:hover {
  background-color: #372a63;
}
   
    </style>
</head>
<body>

<h2>Your Alerts</h2>

<%
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    int seniorId = GetSet.getSeniorId(); // Get logged-in senior's ID

    try {
        con = DBConnection.connect();
        stmt = con.createStatement();
        String query = "SELECT id, alertType, description, date FROM alerts WHERE seniorId = " + seniorId;
        rs = stmt.executeQuery(query);
%>

<table>
    <tr>
        <th>ID</th>
        <th>Message</th>
        <th>Date</th>
    </tr>

<%
    boolean found = false;
    while (rs.next()) {
        found = true;
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><b><%= rs.getString("alertType") %></b><br><%= rs.getString("description") %></td>
        <td><%= rs.getString("date") %></td>
    </tr>
<%
    }

    if (!found) {
%>
    <tr><td colspan="3">No alerts found.</td></tr>
<%
    }
    } catch (Exception e) {
%>
    <tr><td colspan="3" style="color: red;">Error: <%= e.getMessage() %></td></tr>
<%
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (stmt != null) try { stmt.close(); } catch (Exception e) {}
        if (con != null) try { con.close(); } catch (Exception e) {}
    }
%>

</table>
</table>
<div style="text-align: center; margin-top: 20px;">
  <a href="caretakerhome.html" class="back-btn">Back to Admin Home</a>
</div>


</body>
</html>
