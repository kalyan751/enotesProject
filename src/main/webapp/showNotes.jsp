<%@page import="com.User.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.Db.DBConnect"%>
<%@page import="com.DAO.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
UserDetails currentUser3 = (UserDetails) session.getAttribute("userdetails");
if (currentUser3 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error", "please login");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Notes</title>
<%@include file="AllComponent/allCss.jsp"%>
</head>
<body>
	<!-- including the nav bar -->
	<%@include file="AllComponent/navbar.jsp"%>
	<%
	
	String updateMsg = (String)session.getAttribute("update-message");
	
	if(updateMsg != null){%>
		<div class="alert alert-success" role="alert"><%=updateMsg%></div>
	<%
	session.removeAttribute("update-message");
	
	}
	
	
	%>
	
	<%
	
	String wrongMsg = (String)session.getAttribute("wrongMsg");
	
	if(wrongMsg != null){%>
		<div class="alert alert-danger" role="alert"><%=wrongMsg%></div>
	<%
	session.removeAttribute("wrongMsg");
	
	}
	
	
	%>
	

	<div class="container">
		<h2 class="text-center">All Notes</h2>

		<div class="row">
			<div class="col-md-12">

				<%
				if (currentUser3 != null) {
					PostDAO ob = new PostDAO(DBConnect.getConn());
					List<Post> post = ob.getData(currentUser3.getId());

					for (Post po : post) {
				%>
						
										<!-- card -->
				<div class="card mt-3">
					<img src="./img/noteTakingImage.jpg"
						class="card-img-top mt-2 mx-auto" alt="" style="max-width: 100px;">
					
					<!-- Card body -->
					<div class="card-body p-4">
					
					
						<h5 class="card-title"><%=po.getTitle() %></h5>
						<p><%=po.getContent() %></p>
						<p>
							<b class="text-success">Published by:<%=currentUser3.getName() %></b><br> <b class="text-success"></b>
						</p>
						
						<p>
							<b class="text-success">Published Date:<%=po.getPdate() %></b><br> <b class="text-success"></b>
						</p>

						<div class="container text-center mt-2">

							<a href="deleteServlet?note_id=<%=po.getId() %>" class="btn btn-danger">Delete</a>
							 <a href="edit.jsp?note_id=<%=po.getId() %>"
								class="btn btn-primary">Edit</a>
						</div>

					</div>
				</div>
						
				<%
				}
				}
				%>




			</div>

		</div>

	</div>


</body>
</html>