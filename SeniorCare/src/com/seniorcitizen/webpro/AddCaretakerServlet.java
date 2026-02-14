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
 * Servlet implementation class AddCaretakerServlet
 */
public class AddCaretakerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCaretakerServlet() {
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
		String name = request.getParameter("name");
		String contact = request.getParameter("contact");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		int id=0;
		Connection con = DBConnection.connect();
		try {
			PreparedStatement pstmt = con.prepareStatement("Insert into caretaker values(?,?,?,?,?)");
			pstmt.setInt(1,id);
			pstmt.setString(2,name);
			pstmt.setString(3,contact);
			pstmt.setString(4,email);
			pstmt.setString(5,password);
			int rows=pstmt.executeUpdate();
			if(rows>0){
				System.out.println("Caretaker added successfully");
				response.sendRedirect("adminhome.html");

			}else{
				System.out.println("Failed to add caretaker");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		doGet(request, response);
	}

}
