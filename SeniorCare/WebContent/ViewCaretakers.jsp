<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.seniorcitizen.webpro.*" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>View Caretakers | SeniorCare</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />

  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: url('images/05.webp') no-repeat center center fixed;
      background-size: cover;
      margin: 0;
      padding: 0;
    }

    .overlay {
      background-color: rgba(255, 255, 255, 0.62);
      padding: 40px;
      margin: 60px auto;
      max-width: 900px;
      border-radius: 15px;
      box-shadow: 0 8px 24px rgba(0,0,0,0.2);
    }

    h2 {
      text-align: center;
      color: #4b3c80;
      margin-bottom: 30px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background-color: white;
    }

    th, td {
      padding: 14px;
      text-align: center;
      border-bottom: 1px solid #ddd;
    }

    th {
      background-color: #a58df5;
      color: white;
    }

    tr:hover {
      background-color: #f2f2f2;
    }

    .footer {
      text-align: center;
      margin-top: 30px;
      font-size: 13px;
      color: #444;
    }
  </style>
</head>
<body>

<div class="overlay">
  <h2>Registered Caretakers</h2>

<%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        con = DBConnection.connect();
        pstmt = con.prepareStatement("SELECT * FROM caretaker");
        rs = pstmt.executeQuery();
%>

<table>
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Contact</th>
    <th>Email</th>
    <th>Password</th>
  </tr>

<%
    while (rs.next()) {
%>
  <tr>
    <td><%= rs.getInt("id") %></td>
    <td><%= rs.getString("name") %></td>
    <td><%= rs.getString("contact") %></td>
    <td><%= rs.getString("email") %></td>
    <td><%= rs.getString("password") %></td>
  </tr>
<%
    }
  } catch(Exception e) {
      out.println("<p style='color:red;'>Error loading table: " + e.getMessage() + "</p>");
  } finally {
      if (rs != null) rs.close();
      if (pstmt != null) pstmt.close();
      if (con != null) con.close();
  }
%>

</table>
<!-- Back Button -->
<div style="text-align: center; margin-top: 20px;">
    <a href="adminhome.html" style="text-decoration: none;">
  <button style="background-color: #4b3c80; color: white; padding: 10px 20px; font-size: 14px; border: none; border-radius: 6px; cursor: pointer;">
    Back to Admin Home
  </button>
</a>

  </a>
</div>

</div>

<div class="footer">&copy; 2025 SeniorCare | Admin Panel</div>

</body>
</html>
