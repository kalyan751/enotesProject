<%@page import="com.User.UserDetails"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom navbar-custom">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><i class="fa fa-book"
			aria-hidden="true"></i> PersonalNotes.com</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="home.jsp"><i class="fa fa-home"
						aria-hidden="true"></i> Home</a></li>
				<li class="nav-item"><a class="nav-link" href="AddNotes.jsp"><i
						class="fa fa-plus-circle" aria-hidden="true"></i> Add Notes</a></li>
				<li class="nav-item"><a class="nav-link" href="showNotes.jsp"><i
						class="fa fa-address-book" aria-hidden="true"></i> Show Notes</a></li>

				<!--     <li class="nav-item">
          <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
        </li>  -->
			</ul>
			<form class="d-flex">

				<%
				UserDetails user = (UserDetails) session.getAttribute("userdetails");

				if (user != null) {
				%>
				<!-- For the login page -->
				<a href="" button class="btn btn-light me-2" data-bs-toggle="modal" data-bs-target="#exampleModal" type="submit"><i
					class="fa fa-user-circle-o" aria-hidden="true"></i> <%= user.getName() %>
					</button></a> <a href="LogoutServlet" button class="btn btn-light" type="submit"><i
					class="fa fa-user-plus" aria-hidden="true"></i> Logout
					</button></a>
					
					
							<!-- Button trigger modal -->
<!--  <button type="button" class="btn btn-primary" >
  Launch demo modal
</button>-->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="container text-center">
        <i class="fa fa-user-circle-o" aria-hidden="true"></i>
        <h5></h5>
        
        <table class = "table text-center" >
        <tbody>
        	<tr>
        		<th>User Id</th>
        		<td><%= user.getId() %></td>
        	</tr>
        	
        	<tr>
        		<th>Full Name</th>
        		<td><%= user.getName() %></td>
        	</tr>
        	
        	<tr>
        		<th>Email Id</th>
        		<td><%= user.getEmail() %></td>
        	</tr>
        </tbody>
        
        
        </table>
        
        <div>
        	<button type="button" class="btn-primary" data-dismiss="modal">Close</button>
        </div>
        
        
        </div>
      </div>

    </div>
  </div>
		
	</div>
				<%
				} else {
				%>
				<!-- For the homepage and registration page -->
				<a href="login.jsp" button class="btn btn-light me-2" type="submit"><i
					class="fa fa-user-circle-o" aria-hidden="true"></i> Login
					</button></a> <a href="register.jsp" button class="btn btn-light" type="submit"><i
					class="fa fa-user-plus" aria-hidden="true"></i> Register
					</button></a>

				<%
				}
				%>


			</form>
		</div>

	
</nav>