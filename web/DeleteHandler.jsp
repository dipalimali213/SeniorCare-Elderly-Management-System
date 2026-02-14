<%@ page import="java.sql.*" %>
<%@ page import="com.seniorcitizen.webpro.*" %>

<%
    int id = Integer.parseInt(request.getParameter("id"));

    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        con = DBConnection.connect();
        pstmt = con.prepareStatement("DELETE FROM caretaker WHERE id = ?");
        pstmt.setInt(1, id);
        int rows = pstmt.executeUpdate();
        response.sendRedirect("adminhome.html");

        if(rows > 0){
            response.sendRedirect("deletecaretaker.jsp");
        } else {
            out.println("<p style='color:red;'>Deletion failed.</p>");
        }
    } catch(Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
%>
