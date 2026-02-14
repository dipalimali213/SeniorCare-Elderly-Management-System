<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.seniorcitizen.webpro.GetSet" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Set Appointment</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      padding: 30px;
      background: #f9f9f9;
    }
    .form-box {
      max-width: 400px;
      margin: auto;
      background: #fff;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 0 10px #ccc;
    }
    label {
      font-weight: bold;
      display: block;
      margin: 10px 0 5px;
    }
    input {
      width: 100%;
      padding: 10px;
      border-radius: 6px;
      border: 1px solid #ccc;
      margin-bottom: 15px;
    }
    .readonly {
      background-color: #eee;
      font-weight: bold;
    }
    button {
      background: #7a5df5;
      color: white;
      border: none;
      padding: 12px;
      border-radius: 8px;
      width: 100%;
      cursor: pointer;
    }
    button:hover {
      background: #5c3fe6;
    }
  </style>
</head>
<body>
<%
  String caretakerId = request.getParameter("caretakerId");
  String seniorId = request.getParameter("seniorId");
%>
<div class="form-box">
  <h2>Set Appointment</h2>
  <form action="SetAppointmentServlet" method="post">
    <!-- Hidden inputs for submission -->
    <input type="hidden" name="caretakerId" value="<%= caretakerId %>">
    <input type="hidden" name="seniorId" value="<%= seniorId %>">

    <!-- Visible display of Caretaker ID -->
    <label for="caretakerIdDisplay">Caretaker ID</label>
    <input type="text" id="caretakerIdDisplay" value="<%= caretakerId %>" class="readonly" readonly>

    <label for="date">Appointment Date</label>
    <input type="date" name="date" required>

    <label for="time">Appointment Time</label>
    <input type="time" name="time" required>

    <button type="submit">Submit Appointment</button>
  </form>
</div>
</body>
</html>
