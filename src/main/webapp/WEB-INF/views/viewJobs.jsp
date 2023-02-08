<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.entity.Job"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JobPortal</title>
<%@include file="/allResources/css/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">

	<c:if test="${ user.role ne 'admin'}">
		<c:redirect url="login"></c:redirect>
	</c:if>

	<%@include file="/allResources/common/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<h5 class="text-center text-primary">Explore Jobs</h5>

				<%
				List<Job> jobs=(List<Job>) request.getAttribute("jobs");
				for (Job j : jobs) {
				%>

				<div class="card mt-2">
					<div class="card-body">

						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>

						<h6><%=j.getTitle()%></h6>
						<form class="row">
							<p><%=j.getDescription()%></p>
							<div class="col-md-3 mt-1">
								<input type="text" class="form-control form-control-sm"
									value="location:<%=j.getLocation()%>" readonly>
							</div>

							<div class="col-md-3 mt-1">
								<input type="text" class="form-control form-control-sm"
									value="Category:<%=j.getCategory()%>" readonly>
							</div>

							<div class="col-md-3 mt-1">
								<input type="text" class="form-control form-control-sm"
									value="Status:<%=j.getStatus()%>" readonly>
							</div>
						</form>

						<h6>
							Publish Date:<%=j.getPdate() %></h6>

						<div class="text-center">
							<a href="editJob?id=<%=j.getId() %>" class="btn btn-sm bg-success text-white">Edit</a>
							<a href="deleteJob?id=<%=j.getId() %>" class="btn btn-sm bg-danger text-white">Delete</a>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>


</body>
</html>