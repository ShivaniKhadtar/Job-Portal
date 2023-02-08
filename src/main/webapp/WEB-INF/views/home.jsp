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
	background: url("WEB-INF/views/allComponents/img/background-img.jpg");
	width:100%;
	height:85vh;
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}
</style>
</head>
<body>
	<%@include file="/allResources/common/navbar.jsp"%>
	<div class="container-fluid back-img">
		<div class="text-center">
			<h1 class="text-success p-4">
				<i class="fa fa-book me-1" aria-hidden="true"></i>Online Job Portal
			</h1>
		</div>
	</div>
<%@include file="/allResources/common/footer.jsp"%>
</body>
</html>