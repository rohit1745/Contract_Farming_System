package com.FarmerLogin;

import java.io.IOException;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.connection.ConnectionDB;

/**
 * Servlet implementation class f_1_FarmerLogin
 */
@WebServlet("/f_1_FarmerLogin")
public class f_1_FarmerLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public f_1_FarmerLogin() {
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
		
		System.out.println("hii");
		String FEmail=request.getParameter("FEmail");
		System.out.println("email="+FEmail);
		String FPassword=request.getParameter("FPassword");
		System.out.println("password="+FPassword);
		
		System.out.println("hello");
		Connection con=ConnectionDB.connect();
		try {
			PreparedStatement pstmt=con.prepareStatement("select * from farmer where FEmail=? and FPassword=?");
			pstmt.setString(1, FEmail);
			pstmt.setString(2, FPassword);
			ResultSet rs = pstmt.executeQuery();

			if(rs.next())
			{
			    System.out.println("successful");

			    // ✅ SESSION SET KAR (VERY IMPORTANT)
			    HttpSession session = request.getSession();
			    session.setAttribute("userId", rs.getInt("Id"));

			    response.sendRedirect("f_3_FarmerProfile.jsp");
			}
			else
			{
			    response.sendRedirect("index.html");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		
		doGet(request, response);
	}

}
