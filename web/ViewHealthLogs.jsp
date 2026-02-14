<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.seniorcitizen.webpro.DBConnection" %>
<%@ page import="com.seniorcitizen.webpro.GetSet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Your Health Logs</title>
    <style>
        body {
    font-family: Arial, sans-serif;
    background: url('images/24.jpg') no-repeat center center fixed;
    background-size: cover;
    padding: 20px;
}

        table {
            width: 90%;
            margin: auto;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 0 10px #ccc;
        }
        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }
        th {
            background-color: #7a5df5;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        h2 {
            text-align: center;
            color: #4b3c80;
        }
        .no-data {
            text-align: center;
            color: red;
            margin-top: 20px;
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

<h2>Your Health Logs</h2>

<%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    int seniorId = GetSet.getSeniorId();  // Must be set during login

    try {
        con = DBConnection.connect();
        pstmt = con.prepareStatement("SELECT * FROM healthlogs WHERE seniorId = ?");
        pstmt.setInt(1, seniorId);
        rs = pstmt.executeQuery();

        boolean found = false;
%>

<table>
    <tr>
        <th>ID</th>
        <th>Date</th>
        <th>Blood Pressure</th>
        <th>Heart Rate</th>
        <th>Notes</th>
    </tr>

<% while (rs.next()) {
    found = true;
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("date") %></td>
        <td><%= rs.getString("bloodPressure") %></td>
        <td><%= rs.getInt("heartRate") %></td>
        <td><%= rs.getString("notes") %></td>
    </tr>
<% } %>
</table>
<div style="text-align: center; margin-top: 20px;">
  <a href="seniorhome.html" class="back-btn">Back</a>
</div>

<% if (!found) { %>
    <p class="no-data">No logs found for your account.</p>
<% } %>

<%
    } catch (Exception e) {
        out.println("<p class='no-data'>Error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (con != null) try { con.close(); } catch (Exception e) {}
    }
%>

</body>
</html>
