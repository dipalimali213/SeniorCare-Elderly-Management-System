package com.seniorcitizen.webpro;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AlertServlet
 */
public class AlertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AlertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String alertType = request.getParameter("alertType");
	    String description = request.getParameter("description");
	    String date = java.time.LocalDate.now().toString(); 

	    int seniorId = GetSet.getSeniorId();
	    Connection con = DBConnection.connect();

	    try {
	        PreparedStatement pstmt = con.prepareStatement(
	            "INSERT INTO alerts (seniorId, alertType, description, date) VALUES (?, ?, ?, ?)"
	        );
	        pstmt.setInt(1, seniorId);
	        pstmt.setString(2, alertType);
	        pstmt.setString(3, description);
	        pstmt.setString(4, date);

	        int rows = pstmt.executeUpdate();

	        if (rows > 0) {
	            System.out.println("Alert successfully submitted.");
	            response.sendRedirect("seniorhome.html");
	        } else {
	            response.getWriter().println("Failed to raise alert.");
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		doGet(request, response);
	}

}
