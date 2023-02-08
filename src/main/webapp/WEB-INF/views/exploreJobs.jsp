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

	<c:if test="${empty user}">
		<c:redirect url="login"></c:redirect>
	</c:if>

	<%@include file="/allResources/common/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-12">

				<h5 class="text-center text-primary">Explore Jobs</h5>

				<c:if test="${not empty msg}">
					<div class="alert alert-success" role="alert">${msg}</div>
					<c:remove var="msg" />
				</c:if>

				<div class="card mt-2">
					<div class="card-body">

						<form class="row" action="searchJobs" method="get">

							<div class="col-md-5">
								<label>Location</label><select name="location"
									class="form-control form-select" id="selectLocation">
									<option value="lo">Select</option>
									<option value="Pune">Pune</option>
									<option value="Bangalore">Bangalore</option>
									<option value="Hyderabad">Hyderabad</option>
									<option value="Delhi">Delhi</option>
									<option value="Mumbai">Mumbai</option>
								</select>
							</div>

							<div class="col-md-5">
								<label>Category</label><select name="category"
									class="form-control form-select" id="selectCategory">
									<option value="ca">Select</option>
									<option value="Education">Education</option>
									<option value="Engineering/Technology">Engineering/Technology</option>
									<option value="Sales/Marketing">Sales/Marketing</option>
									<option value="Banking">Banking</option>
									<option value="Business/Management">Business/Management</option>
								</select>
							</div>

							<div class="col mt-1 text-center text-md-start pt-md-3">
								<button type="submit" class="btn btn-success px-4" >Submit</button>
							</div>

						</form>

					</div>
				</div>

				<%
				List<Job> jobs = (List<Job>) request.getAttribute("jobs");
				for (Job j : jobs) {
				%>

				<div class="card mt-2">
					<div class="card-body">

						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>

						<form class="row">

							<h6><%=j.getTitle() %></h6>

							<%
							if (j.getDescription().length() >= 0 && j.getDescription().length() < 120) {
							%>
							<p><%=j.getDescription()%></p>
							<%
							} else {
							%>
							<p><%=j.getDescription().substring(0, 120)%>...
							</p>
							<%
							}
							%>

							<div class="col-md-3 mt-1">
								<input type="text" class="form-control form-control-sm"
									value="location:<%=j.getLocation() %>" readonly>
							</div>

							<div class="col-md-3 mt-1">
								<input type="text" class="form-control form-control-sm"
									value="Category:<%=j.getCategory() %>" readonly>
							</div>

							<h6 class="mt-2">
								Publish Date:<%=j.getPdate() %></h6>

							<div class="text-center">
								<a href="jobView?id=<%=j.getId() %>"
									class="btn btn-sm bg-success text-white">View More</a>
							</div>

						</form>

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