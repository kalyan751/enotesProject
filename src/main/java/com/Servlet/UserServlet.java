package com.Servlet;
 
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.Db.DBConnect;
import com.User.UserDetails;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet{
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException  {
		
		//retrieving the data that the user gives
		String name = request.getParameter("fname");
		String email = request.getParameter("uemail");
		String password = request.getParameter("upassword");
		
		UserDetails userDetails = new UserDetails();
		
		userDetails.setName(name);
		userDetails.setEmail(email);
		userDetails.setPassword(password);
		
		
		//addinng the data in the database
		UserDAO dao = new UserDAO(DBConnect.getConn());
		PrintWriter out = response.getWriter();
		boolean flag = dao.addUser(userDetails);
		HttpSession session = null;;
		if(flag == true) {
			session = request.getSession();
			session.setAttribute("reg-success", "Registration successful");
			response.sendRedirect("register.jsp");
		}else {
			session = request.getSession();
			session.setAttribute("reg-failed", "Something went wrong on server");
			response.sendRedirect("register.jsp");
			
		}
	}
}
