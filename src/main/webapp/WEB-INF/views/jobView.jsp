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

				<%
				Job j=(Job) request.getAttribute("job");
				%>

				<div class="card mt-2">
					<div class="card-body">

						<div class="text-center text-primary">
							<i class="far fa-clipboard fa-2x"></i>
						</div>

						<form class="row">

							<h6><%=j.getTitle() %></h6>

							<p><%=j.getDescription() %></p>

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

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>