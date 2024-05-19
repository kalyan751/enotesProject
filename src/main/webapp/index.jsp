<%@page import="com.Db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%> <!-- Add this import statement -->
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.back-image {
	background: url("img/NoteBookImg2.jpg");
	width: 100%;
	height: 81vh;
	background-size: cover;
	background-repeat: no-repeat;
}
</style>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<%@include file="AllComponent/allCss.jsp"%>
</head>
<body>
	<%@include file="AllComponent/navbar.jsp"%>
	
	<div class="container-fluid back-image">

		<div class="text-center">
			<h1 class="text-white pt-5"><i class="fa fa-book" aria-hidden="true"></i> Welcome To PersonalNotes.com</h1>
			<a href="login.jsp" class="btn btn-light"><i class="fa fa-user-circle-o" aria-hidden="true"></i> Login</a> 
			<a href="register.jsp" class="btn btn-light"><i class="fa fa-user-plus" aria-hidden="true"></i> Register</a>
		</div>

	</div>

	<%@include file="AllComponent/footer.jsp"%>

</body>
</html>