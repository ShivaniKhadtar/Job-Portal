<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<div class="container p-2">
		<div class="row p-5">
			<div class="col-md-10 offset-md-1">
				<div class="card">
					<div class="card-body">

						<%
						Job j = (Job) request.getAttribute("job");
						%>

						<div class="text-center text-success">
							<i class="fas fa-user-friends fa-3x"></i>
							<h5>Edit Job</h5>
						</div>

						<c:if test="${not empty msg }">
							<h4 class="alert alert-success text-center" role="alert">${msg}</h4>
							<c:remove var="succMsg" />
						</c:if>

						<form class="row gy-3" action="updateJob" method="post">

							<input type="hidden" value="<%=j.getId()%>" name="id">

							<div>
								<label>Enter Title</label><input type="text"
									class="form-control" required name="title"
									value="<%=j.getTitle()%>">
							</div>

							<div class="col-md-4">
								<label>Location</label> <select name="location"
									class="form-control form-select" id="selectLocation">
									<option value="<%=j.getLocation()%>"><%=j.getLocation()%></option>
									<option value="Pune">Pune</option>
									<option value="Bangalore">Bangalore</option>
									<option value="Hyderabad">Hyderabad</option>
									<option value="Delhi">Delhi</option>
									<option value="Mumbai">Mumbai</option>
								</select>
							</div>

							<div class="col-md-4">
								<label>Category</label><select name="category"
									class="form-control form-select" id="selectCategory">
									<option value="<%=j.getCategory()%>"><%=j.getCategory()%></option>
									<option value="Education">Education</option>
									<option value="Engineering/Technology">Engineering/Technology</option>
									<option value="Sales/Marketing">Sales/Marketing</option>
									<option value="Banking">Banking</option>
									<option value="Business/Management">Business/Management</option>
								</select>
							</div>

							<div class="col-md-4">
								<label>Status</label> <select name="status"
									class="form-control form-select" id="selectStatus">
									<option class="Active" value="<%=j.getStatus()%>"><%=j.getStatus()%></option>
									<option class="Active" value="Active">Active</option>
									<option class="Inactive" value="Inactive">Inactive</option>
								</select>
							</div>

							<div>
								<label>Enter Description</label>
								<textarea required rows="6" cols="" name="description"
									class="form-control"><%=j.getDescription()%></textarea>
							</div>

							<div class="text-center">
								<button type="submit"
									class="btn btn-success col-md-4 rounded-pill align-center">Update
								</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>