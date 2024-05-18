package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.Db.DBConnect;
import com.User.UserDetails;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("uemail");
		String password = request.getParameter("upassword");
		
		UserDetails userDetails = new UserDetails();
		userDetails.setEmail(email);;
		userDetails.setPassword(password);
		
		UserDAO dao = new UserDAO(DBConnect.getConn());
		UserDetails user  = dao.loginUser(userDetails);
		
		//if the user gives the correct details then redirect him to home page
		if(user != null) {
			HttpSession session = request.getSession();
			//setting the attributes for that session
			session.setAttribute("userdetails", user);
			response.sendRedirect("home.jsp");
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("login-failed", "Invalid username and password");
			response.sendRedirect("login.jsp");
		}
		
	}

}
