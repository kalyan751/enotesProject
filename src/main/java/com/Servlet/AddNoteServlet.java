package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.PostDAO;
import com.Db.DBConnect;
import com.User.Post;

/**
 * Servlet implementation class AddNoteServlet
 */
@WebServlet("/AddNoteServlet")
public class AddNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int uid = Integer.parseInt(request.getParameter("uid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		
		PostDAO postDAO = new PostDAO(DBConnect.getConn());
		
		
		
		boolean flag = postDAO.addNotes(title, content, uid);
		
		if(flag) {
			System.out.println("Data inserted Successfully");
			response.sendRedirect("showNotes.jsp");
		}else {
			System.out.println("Data Not inserted");
		}
	}

}
