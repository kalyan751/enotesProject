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

/**
 * Servlet implementation class NotesEditServlet
 */
@WebServlet("/NotesEditServlet")
public class NotesEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Integer noteid = Integer.parseInt(request.getParameter("noteid"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			
			PostDAO dao = new PostDAO(DBConnect.getConn());
			boolean flag = 	dao.postUpdate(noteid, title, content);
			
			if(flag) {
				System.out.println("Data updated successfully");
				HttpSession session = request.getSession();
				session.setAttribute("update-message", "Notes Updated successfully");
				response.sendRedirect("showNotes.jsp");
			}else {
				System.out.println("Data not updated");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
