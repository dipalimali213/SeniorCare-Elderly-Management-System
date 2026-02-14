<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.seniorcitizen.webpro.DBConnection" %>
<%@ page import="com.seniorcitizen.webpro.GetSet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>All Caretakers</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            padding: 20px;
            background: url('images/24.jpg') no-repeat center center fixed;
    		background-size: cover;
        }
        table {
            width: 90%;
            border-collapse: collapse;
            margin: 20px auto;
            background: #fff;
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
            background-color: #f1f1f1;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        .btn {
            padding: 6px 12px;
            background-color: #6848e2;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #5b3dd0;
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

<h2>Registered Caretakers</h2>

<%
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;

    int seniorId = GetSet.getSeniorId(); // static getter method

    try {
        con = DBConnection.connect();
        stmt = con.createStatement();
        String query = "SELECT * FROM caretaker";
        rs = stmt.executeQuery(query);
%>

<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Contact</th>
        <th>Email</th>
        <th>Action</th>
    </tr>

<%
    while (rs.next()) {
        int caretakerId = rs.getInt("id");
%>
    <tr>
        <td><%= caretakerId %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("contact") %></td>
        <td><%= rs.getString("email") %></td>
        <td>
            <form action="setappointment.jsp" method="post" style="margin: 0;">
                <input type="hidden" name="seniorId" value="<%= seniorId %>"/>
                <input type="hidden" name="caretakerId" value="<%= caretakerId %>"/>
                <button type="submit" class="btn">Set Appointment</button>
            </form>
        </td>
    </tr>
<%
    }
%>

</table>
<div style="text-align: center; margin-top: 20px;">
  <a href="seniorhome.html" class="back-btn">Back to Admin Home</a>
</div>


<%
    } catch (Exception e) {
        out.println("<p>Error: " + e.getMessage() + "</p>");
    } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (stmt != null) try { stmt.close(); } catch (Exception e) {}
        if (con != null) try { con.close(); } catch (Exception e) {}
    }
%>

</body>
</html>
