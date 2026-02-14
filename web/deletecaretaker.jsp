<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
  background: url('images/16.jpg') no-repeat center center fixed;
  background-size: cover;
  padding: 40px;
}


    .table-container {
      background: white;
      padding: 30px;
      border-radius: 15px;
      max-width: 1000px;
      margin: auto;
      box-shadow: 0 10px 25px rgba(200, 300, 50, 0.30);
    }

    h2 {
      text-align: center;
      color: #4b3c80;
      margin-bottom: 30px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
    }

    th, td {
      border: 1px solid #ccc;
      padding: 14px;
      text-align: center;
    }

    th {
      background-color: #a58df5;
      color: white;
    }

    tr:hover {
      background-color: #f9f9f9;
    }

    .btn-delete {
      background-color: #e74c3c;
      color: white;
      padding: 6px 12px;
      text-decoration: none;
      border-radius: 5px;
      font-weight: 600;
    }

    .btn-delete:hover {
      background-color: #c0392b;
    }

  </style>
</head>
<body>

<div class="table-container">
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
      <th>Action</th>
    </tr>

    <% while (rs.next()) { %>
      <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("contact") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("password") %></td>
        <td>
          <form action="DeleteHandler.jsp" method="post" style="margin:0;">
            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
            <button class="btn-delete" type="submit">Delete</button>
          </form>
        </td>
      </tr>
    <% } %>

  </table>

  <%
    } catch(Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
  %>
</div>

</body>
</html>
