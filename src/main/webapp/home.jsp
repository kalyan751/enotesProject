<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
UserDetails currentUser2 = (UserDetails) session.getAttribute("userdetails");
if (currentUser2 == null) {
	response.sendRedirect("login.jsp");
	session.setAttribute("Login-error","please login");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>

<!-- Adding the css files -->
<%@include file='AllComponent/allCss.jsp'%>

</head>
<body>




	<div class="container-fluid p-0">
		<!-- Adding the Nav Bar -->
		<%@include file="AllComponent/navbar.jsp"%>
		<div class="card py-5">
			<div class="card-body text-center">
				<img alt="" src="img/noteTakingImage.jpg" class="img-fluid mx-auto" style = "width:550px">
				<h1>START TAKING YOUR NOTES</h1>
				<a href = "AddNotes.jsp" class="btn btn-outline-primary">Start Here</a>
			</div>
		</div>
	</div>
<%@include file="AllComponent/footer.jsp" %>
</body>
</html>