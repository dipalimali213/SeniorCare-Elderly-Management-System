package com.seniorcitizen.webpro;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddSeniorHealthServlet
 */
public class AddSeniorHealthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSeniorHealthServlet() {
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
		 try {
	            int seniorId = Integer.parseInt(request.getParameter("seniorId"));
	            String date = request.getParameter("date");
	            String bloodPressure = request.getParameter("bloodPressure");
	            int heartRate = Integer.parseInt(request.getParameter("heartRate"));
	            String notes = request.getParameter("notes");

	            Connection con = DBConnection.connect();

	            if (con == null) {
	                response.getWriter().println("Database connection failed.");
	                return;
	            }

	            PreparedStatement pstmt = con.prepareStatement(
	                "INSERT INTO healthlogs (seniorId, date, bloodPressure, heartRate, notes) VALUES (?, ?, ?, ?, ?)"
	            );
	            pstmt.setInt(1, seniorId);
	            pstmt.setString(2, date);
	            pstmt.setString(3, bloodPressure);
	            pstmt.setInt(4, heartRate);
	            pstmt.setString(5, notes);

	            int rows = pstmt.executeUpdate();
	            if (rows > 0) {
	                System.out.println("Log saved successfully!");
	                response.sendRedirect("caretakerhome.html");
	            } else {
	                response.getWriter().println("Failed to save log.");
	            }

	        } catch (NumberFormatException e) {
	            response.getWriter().println("Invalid number input: " + e.getMessage());
	        } catch (SQLException e) {
	            response.getWriter().println("SQL Error: " + e.getMessage());
	        }

		doGet(request, response);
	}

}
