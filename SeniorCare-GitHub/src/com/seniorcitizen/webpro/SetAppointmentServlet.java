package com.seniorcitizen.webpro;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SetAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SetAppointmentServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Step 1: Get all parameters from the form
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		int seniorId = Integer.parseInt(request.getParameter("seniorId"));
		int caretakerId = Integer.parseInt(request.getParameter("caretakerId"));

		// Step 2: Establish database connection
		Connection con = DBConnection.connect();

		try {
			// Step 3: Prepare and execute the insert query
			PreparedStatement pstmt = con.prepareStatement(
					"INSERT INTO appointments (seniorId, caretakerId, date, time) VALUES (?, ?, ?, ?)");
			pstmt.setInt(1, seniorId);
			pstmt.setInt(2, caretakerId);
			pstmt.setString(3, date);
			pstmt.setString(4, time);

			int rows = pstmt.executeUpdate();

			if (rows > 0) {
				System.out.println("Appointment successfully stored.");
				response.sendRedirect("seniorhome.html");
			} else {
				response.getWriter().println("Failed to set appointment.");
			}
		} catch (SQLException e) {
			e.printStackTrace();
			response.getWriter().println("Database error: " + e.getMessage());
		}
	}
}
