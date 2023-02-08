<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@page import="com.spring.entity.User" %>
<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<div class="container-fluid">
	
		<a class="navbar-brand" href="#">Navbar</a>
		
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse nav-left"
			id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
			
				<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="home">Home</a></li>
					
				<c:if test="${user.role eq 'admin'}">
					<li class="nav-item"><a class="nav-link" href="postJobs"><i
							class="fa fa-plus-circle me-1"></i>Post Job</a></li>
					<li class="nav-item"><a class="nav-link" href="viewJobs"><i
							class="fas fa-eye me-1"></i>View Job</a></li>
				</c:if>
				
				<c:if test="${user.role eq 'user'}">
					<li class="nav-item"><a class="nav-link" href="exploreJobs"><i
							class="fas fa-eye me-1"></i>Explore Job</a></li>
				</c:if>
				
			</ul>
			
			<div class="my-2 my-lg-0 nav-right">
			
				<c:if test="${user.role eq 'admin'}">
					<a href="#" class="btn btn-light me-1"><i
						class="fa-solid fa-user me-1"></i>Admin </a>
					<a href="logOut" class="btn btn-light"><i
						class="fa-solid fa-sign-in-alt me-1"></i>LogOut</a>
				</c:if>
				
				<c:if test="${user.role eq 'user'}">
					<a data-bs-toggle="modal" data-bs-target="#exampleModal"
						class="btn btn-light me-1"><i class="fa-solid fa-user me-1"></i>${user.name}</a>
					<a href="logOut" class="btn btn-light"><i
						class="fa-solid fa-sign-in-alt me-1"></i>LogOut</a>
				</c:if>
				
				<c:if test="${empty user}">
					<a href="login" class="btn btn-light me-1"><i
						class="fa-solid fa-sign-in-alt me-1"></i>LogIn </a>
					<a href="signUp" class="btn btn-light"><i
						class="fa-solid fa-sign-in-alt me-1"></i>SignUp</a>
				</c:if>
			
			</div>
		</div>
	</div>
</nav>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Profile</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="card">
					<div class="card-body">
						<div class="text-center text-primary">
							<i class="fa-solid fa-user me-1"></i>
						</div>
						<table class="table">
							
							<tr>
								<th scope="row">Name</th>
								<th>${user.name }</th>
							</tr>
							<tr>
								<th scope="row">Email</th>
								<th>${user.email }</th>
							</tr>
							
						</table>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">Close</button>
				<a href="editProfile" class="btn btn-primary">Edit</a>
			</div>
		</div>
	</div>
</div>



