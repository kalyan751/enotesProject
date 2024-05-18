<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<%@include file="AllComponent/allCss.jsp"%>


</head>
<body>
<body>
	<%@include file="AllComponent/navbar.jsp"%>

	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">

				<!-- Making a card -->
				<div class="card mt-4">
					<div class="card-header text-center text-white bg-custom">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h4>Login Page</h4>

					</div>


					<%
					String invalidMsg = (String) session.getAttribute("login-failed");

					if (invalidMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=invalidMsg%></div>
					<%
					session.removeAttribute("login-failed");
					}
					%>

					<%
					String withoutLoginMsg = (String) session.getAttribute("Login-error");
					if (withoutLoginMsg != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=withoutLoginMsg%></div>
					<%
					session.removeAttribute("Login-error");
					}
					%>
					
					<%
					 String logOutMsg= (String)session.getAttribute("logoutMsg");
					if(logOutMsg!=null){%>
						<div class="alert alert-success" role="alert"><%=logOutMsg%></div>
					<%
					session.removeAttribute("logoutMsg");
					}
					
					%>
					<div class="card-body">
						<form method="post" action="./LoginServlet">

							<div class="mb-3">
								<label>Enter Email</label> <input type="email"
									class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" name="uemail">

							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Enter
									Password</label> <input type="password" class="form-control"
									id="exampleInputPassword1" name="upassword">
							</div>

							<button type="submit"
								class="btn btn-primary rounded-pill d-block w-100">Login</button>
						</form>

					</div>

				</div>


			</div>


		</div>


	</div>
	<!--  <%@include file="AllComponent/footer.jsp"%>-->
	
	<div class="container-fluid bg-dark mt-0">

<p class="text-center text-white">Designed and developed by Kalyan Jha</p>
<p class="text-center text-white">Developed when I was learning about building Web Applications using java Servlet </p>
</div>
</body>


</body>
</html>