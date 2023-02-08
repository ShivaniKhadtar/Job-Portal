<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JobPortal</title>
<%@include file="/allResources/css/allCss.jsp"%>
<style type="text/css">
.back-img {
	background: url("allComponents/img/admin-back.jpg");
	width: 100%;
	height: 90vh;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body >

	<c:if test="${ user.role ne 'admin'}">
		<c:redirect url="login"></c:redirect>
	</c:if>
	
	<%@include file="/allResources/common/navbar.jsp"%>

	<div class="container-fluid back-img">
		<div class="text-center">
			<h1 class="text-dark p-4">Welcome Admin</h1>
		</div>
	</div>

</body>
</html>