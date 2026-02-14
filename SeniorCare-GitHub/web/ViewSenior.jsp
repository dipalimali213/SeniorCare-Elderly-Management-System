<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.seniorcitizen.webpro.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Registered Seniors | SeniorCare</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      background: url('images/15.jpg') no-repeat center center fixed;
      background-size: cover;
      margin: 0;
      padding: 0;
    }

    .overlay {
      background-color: rgba(255, 255, 255, 0.92);
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
      background-color: #7a5df5;
      color: white;
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
  <h2>Registered Seniors</h2>

  <%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        con = DBConnection.connect();
        pstmt = con.prepareStatement("SELECT * FROM senior");
        rs = pstmt.executeQuery();
  %>

  <table>
    <tr>
      <th>ID</th>
      <th>Name</th>
      <th>Age</th>
      <th>Contact</th>
      <th>Address</th>
      <th>Email</th>
    </tr>

    <%
      while (rs.next()) {
    %>
    <tr>
      <td><%= rs.getInt("id") %></td>
      <td><%= rs.getString("name") %></td>
      <td><%= rs.getInt("age") %></td>
      <td><%= rs.getString("contact") %></td>
      <td><%= rs.getString("address") %></td>
      <td><%= rs.getString("email") %></td>
    </tr>
    <%
      }
    %>
  </table>
  <div style="text-align: center; margin-top: 20px;">
  <a href="adminhome.html" class="back-btn">Back to Admin Home</a>
</div>
  

  <%
    } catch(Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (con != null) con.close();
    }
  %>
</div>

<div class="footer">&copy; 2025 SeniorCare | Admin Panel</div>

</body>
</html>
