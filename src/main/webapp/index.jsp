<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>JSP - Hello World</title>
	<link rel="stylesheet" href="/resources/css/layout.css">
	<link rel="stylesheet" href="/resources/css/table.css">
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</head>
<body>
<header>
	<jsp:include page="/JSP/include/topMenu.jsp"/>
</header>
<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
	<div class="carousel-inner">
		<div class="carousel-item active" >
			<img src="/resources/images/lion.png" class="d-block w-100" alt="/resources/images/lion2.png" style="opacity: 0.8;">
		</div>
		<div class="carousel-item" >
			<img src="/resources/images/lion2.png" class="d-block w-100" alt="/resources/images/lion3.png" style="opacity: 0.8;">
		</div>
		<div class="carousel-item" >
			<img src="/resources/images/lion3.png" class="d-block w-100" alt="/resources/images/lion1.png" style="opacity: 0.8;">
		</div>
	</div>
	<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Previous</span>
	</button>
	<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
		<span class="carousel-control-next-icon" aria-hidden="true"></span>
		<span class="visually-hidden">Next</span>
	</button>
</div>
<footer>
	<%@ include file="/JSP/include/footer.jsp" %>
</footer>
</body>
</html>