package com.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.PostDAO;
import com.Db.DBConnect;
import com.User.Post;

@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer noteId = Integer.parseInt(request.getParameter("note_id"));
		
		PostDAO dao = new PostDAO(DBConnect.getConn());
		
		boolean flag = dao.deletNotes(noteId);
		HttpSession session = null;
		if(flag) {
			session = request.getSession();
			session.setAttribute("update-message", "Note Deleted Successfully");
			response.sendRedirect("showNotes.jsp");
		}else {
			session = request.getSession();
			session.setAttribute("wrongMsg", "Something went wrong on server");
			response.sendRedirect("showNotes.jsp");
		}
		
	}

}
