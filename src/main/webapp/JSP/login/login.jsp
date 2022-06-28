<%--
  Created by IntelliJ IDEA.
  User: jyp
  Date: 2022/06/14
  Time: 2:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title>Title</title>
	<link rel="stylesheet" href="/resources/css/layout.css">
	<link rel="stylesheet" href="/resources/css/table.css">
	<script src="/resources/js/myJS.js"></script>
	<script>
        function checkForm() {
            let f = document.loginForm
            if (isNull(f.id, "아이디") || isNull(f.password, "비밀번호")) {
                return false;
            }
        }
	</script>
</head>
<body>
<header>
	<jsp:include page="/JSP/include/topMenu.jsp"/>
</header>
<section>
	<div align="center">
		<hr>
		<h2>로그인</h2>
		<hr>
		<form action="loginProcess.jsp" method="post" onsubmit="return checkForm()" name="loginForm">
			<table style="width: 60%">
				<tr>
					<th>아이디</th>
					<th><input type="text" name="id" style="width: 90%"></th>
				</tr>
				<tr>
					<th>비밀번호</th>
					<th><input type="password" name="password" style="width: 90%"></th>
				</tr>
			</table>
			<br>
			<input type="submit" value="로그인">
		</form>
	</div>
</section>
<footer>
	<%@ include file="/JSP/include/footer.jsp" %>
</footer>
</body>
</html>