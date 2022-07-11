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
	<title>로그인</title>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	        crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	      integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
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
<div class="container mt-5 mb-5">
	<div class="row">
		<div class="col">
			<img src="/resources/images/lion4.jpeg" class="img-fluid" style="border-radius: 10px">
		</div>
		<div class="col">
			<div class="sidenav">
				<div class="login-main-text">
					<h2>Application<br> Login Page</h2>
					<p>Login from here to access.</p>
				</div>
			</div>
			<div class="main">
				<div class="col-md-6 col-sm-12">
					<div class="login-form">
						<form action="loginProcess.jsp" method="post" onsubmit="return checkForm()" name="loginForm">
							<div class="form-group">
								<label>User Name</label>
								<input type="text" name="id" class="form-control" placeholder="User Name">
							</div>
							<div class="form-group mt-3">
								<label>Password</label>
								<input type="password" name="password" class="form-control" placeholder="Password">
							</div>
							<button type="submit" value="로그인" class="btn btn-secondary mt-3">Login</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<footer>
	<%@ include file="/JSP/include/footer.jsp" %>
</footer>
</body>
</html>