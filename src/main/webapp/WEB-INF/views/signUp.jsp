<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JobPortal</title>
<%@include file="/allResources/css/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@include file="/allResources/common/navbar.jsp"%>

	<div class="container-fluid">
		<div class="row p-5">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">

						<div class="text-center">
							<i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
							<h5>Registration Page</h5>
						</div>

						<c:if test="${not empty msg }">
							<h4 class="alert alert-success text-center" role="alert">${msg}</h4>
							<c:remove var="succMsg"/>
						</c:if>

						<form action="registerServlet" method="post">
							<div class="mb-3">
								<label>Enter Full name</label><input type="text"
									class="form-control" name="name">
							</div>
							<div class="mb-3">
								<label>Enter Email</label><input type="email"
									class="form-control" required="required"
									id="exampleInputEmail1" aria-describedly="emailHelp" name="email"
									placeholder="abc@gmail.com">
							</div>
							<div class="mb-3">
								<label for="exampleInputPassword1">Enter Password</label><input
									type="password" class="form-control" required="required"
									id="exampleInputPassword1" name="password">
							</div>
							<button type="submit"
								class="btn btn-primary form-control rounded-pill mt-3">Register</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div style="margin-top: 2rem;">
		<%@include file="/allResources/common/footer.jsp"%></div>
</body>
</html>