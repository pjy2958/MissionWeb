<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>JSP - Hello World</title>
	<link rel="stylesheet" href="/resources/css/layout.css">
	<link rel="stylesheet" href="/resources/css/table.css">
</head>
<body>
<header>
	<jsp:include page="/JSP/include/topMenu.jsp"/>
</header>
<section>
	section부분
</section>
<footer>
	<%@ include file="/JSP/include/footer.jsp" %>
</footer>
</body>
</html>