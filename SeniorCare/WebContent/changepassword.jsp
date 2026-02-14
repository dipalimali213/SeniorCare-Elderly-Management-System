<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.seniorcitizen.webpro.DBConnection" %>
<%@ page import="com.seniorcitizen.webpro.GetSet" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Change Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef;
            padding: 40px;
            background: url('images/18.jpg') no-repeat center center fixed;
   			 background-size: cover;
        }
        .form-box {
            width: 400px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 10px #aaa;
        }
        h2 {
            text-align: center;
            color: #4b3c80;
        }
        label {
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }
        input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        button {
            margin-top: 20px;
            width: 100%;
            padding: 12px;
            background-color: #7a5df5;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
        button:hover {
            background-color: #5a3ce6;
        }
        .message {
            text-align: center;
            margin-top: 15px;
            font-weight: bold;
            color: green;
        }
        .error {
            color: red;
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

<div class="form-box">
    <h2>Change Password</h2>
    <form method="post">
        <label>Current Password</label>
        <input type="password" name="currentPassword" required>

        <label>New Password</label>
        <input type="password" name="newPassword" required>

        <label>Confirm New Password</label>
        <input type="password" name="confirmPassword" required>

        <button type="submit">Change Password</button>
    </form>
 <div style="text-align: center; margin-top: 20px;">
  <a href="seniorhome.html" class="back-btn">Back to Admin Home</a>
</div>
 

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            int seniorId = GetSet.getSeniorId();
            String current = request.getParameter("currentPassword");
            String newPass = request.getParameter("newPassword");
            String confirm = request.getParameter("confirmPassword");

            Connection con = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                con = DBConnection.connect();
                pstmt = con.prepareStatement("SELECT password FROM senior WHERE id = ?");
                pstmt.setInt(1, seniorId);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    String existingPass = rs.getString("password");
                    if (!existingPass.equals(current)) {
                        out.println("<p class='message error'>Incorrect current password.</p>");
                    } else if (!newPass.equals(confirm)) {
                        out.println("<p class='message error'>New passwords do not match.</p>");
                    } else {
                        pstmt.close();
                        pstmt = con.prepareStatement("UPDATE senior SET password = ? WHERE id = ?");
                        pstmt.setString(1, newPass);
                        pstmt.setInt(2, seniorId);
                        int updated = pstmt.executeUpdate();
                        if (updated > 0) {
                            out.println("<p class='message'>Password updated successfully!</p>");
                        } else {
                            out.println("<p class='message error'>Failed to update password.</p>");
                        }
                    }
                } else {
                    out.println("<p class='message error'>User not found.</p>");
                }
            } catch (Exception e) {
                out.println("<p class='message error'>Error: " + e.getMessage() + "</p>");
            } finally {
                if (rs != null) try { rs.close(); } catch (Exception e) {}
                if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
                if (con != null) try { con.close(); } catch (Exception e) {}
            }
        }
    %>
</div>

</body>
</html>
