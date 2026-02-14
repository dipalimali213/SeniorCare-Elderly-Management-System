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
 * Servlet implementation class SeniorRegisterServlet
 */
public class SeniorRegisterServlet  extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SeniorRegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String contact = request.getParameter("contact");
		String address = request.getParameter("address");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		int id=0;
		Connection con=DBConnection.connect();
		try {
			PreparedStatement pstmt = con.prepareStatement("Insert into senior values(?,?,?,?,?,?,?)");
			pstmt.setInt(1,id);
			pstmt.setString(2,name);
			pstmt.setInt(3,age);
			pstmt.setString(4,contact);
			pstmt.setString(5,address);
			pstmt.setString(6,email);
			pstmt.setString(7,password);
			int rows=pstmt.executeUpdate();
			if(rows>0){
				System.out.println("Senior added successfully");
				response.sendRedirect("index.html");

			}else{
				System.out.println("Failed to add Senior");
				response.sendRedirect("seniorlogin.html");

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		doGet(request, response);
	}

}
