package com.seniorcitizen.webpro;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class CaretakerLoginServlet
 */
public class CaretakerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CaretakerLoginServlet() {
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
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Connection con = (Connection) DBConnection.connect();
		try {
			PreparedStatement pstmt = con.prepareStatement("Select * from caretaker where email=? and password=?");
			pstmt.setString(1, email);
			pstmt.setString(2,password);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				int id = rs.getInt("id");
			    GetSet.setCaretakerId(id);
			    if(rs.getString("email").equals(email) && rs.getString("password").equals(password)){
					System.out.println("Caretaker login Successfully");
					response.sendRedirect("caretakerhome.html");
				}else{
					System.out.println("Emai or Password is Incorrect");
					response.sendRedirect("caretakerlogin.html");
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		doGet(request, response);
	}

}
