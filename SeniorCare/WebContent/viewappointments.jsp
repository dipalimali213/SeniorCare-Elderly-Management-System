<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.seniorcitizen.webpro.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Appointments</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            padding: 30px;
            background: url('images/24.jpg') no-repeat center center fixed;
    		background-size: cover;
        }
        table {
            width: 90%;
            border-collapse: collapse;
            margin: auto;
            background: white;
            box-shadow: 0 0 10px #aaa;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background-color: #7a5df5;
            color: white;
        }
        h2 {
            text-align: center;
            color: #333;
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

<h2>Your Appointments</h2>

<%
    int caretakerId = GetSet.getCaretakerId();
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        con = DBConnection.connect();
        stmt = con.createStatement();
        String query = "SELECT * FROM appointments WHERE caretakerId = " + caretakerId;
        rs = stmt.executeQuery(query);
%>

<table>
    <tr>
        <th>Appointment ID</th>
        <th>Senior ID</th>
        <th>Date</th>
        <th>Time</th>
    </tr>
<%
    while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getInt("seniorId") %></td>
        <td><%= rs.getString("date") %></td>
        <td><%= rs.getString("time") %></td>
    </tr>
<%
    }
%>
</table>
<div style="text-align: center; margin-top: 20px;">
  <a href="caretakerhome.html" class="back-btn">Back to Admin Home</a>
</div>


<%
    } catch(Exception e) {
        out.println("<p style='color:red;'>Error fetching appointments: " + e.getMessage() + "</p>");
    }
%>


</body>
</html>
