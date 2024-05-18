<%@page import="com.User.Post"%>
<%@page import="com.DAO.PostDAO"%>
<%@page import="com.Db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
UserDetails currentUser1 = (UserDetails) session.getAttribute("userdetails");
if (currentUser1 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "please login");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Page</title>
<%@include file="AllComponent/allCss.jsp"%>

</head>
<body>
	<%
	Integer noteId = Integer.parseInt(request.getParameter("note_id"));
	
	PostDAO post = new PostDAO(DBConnect.getConn());
	
	Post p = post.getDataById(noteId);
	
	%>
	<!-- including the nav bar -->
	<%@include file="AllComponent/navbar.jsp"%>
	<div class="container-fluid">
		<h1 class="text-center">Edit Your Notes</h1>
		<div class="container">
			<div class="row">
				<div class="col-md-12">

					<!-- Need two form elements -->
					<form action="./NotesEditServlet" method="post">

						<input type="hidden" value="<%=noteId%>" name = "noteid">

						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Enter
								Title</label> <input type="text" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								name="title" required="required" value="<%=p.getTitle() %>">

						</div>

						<div class="mb-3">
							<label for="exampleInputEmail1" class="form-label">Enter
								Content</label>
							<textarea rows="12" cols="" class="form-control" name="content"
								required="required"><%=p.getContent() %></textarea>

						</div>
						<div class="container text-center">
							<button type="submit" class="btn btn-primary text-center">AddNotes</button>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>

	<%@include file="AllComponent/footer.jsp"%>

</body>
</html>