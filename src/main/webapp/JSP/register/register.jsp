<%--
  Created by IntelliJ IDEA.
  User: jyp
  Date: 2022/07/06
  Time: 8:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>회원가입</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
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
<section class="vh-100 bg-image"
         style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
	<div class="mask d-flex align-items-center h-100 gradient-custom-3">
		<div class="container h-100">
			<div class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-12 col-md-9 col-lg-7 col-xl-6">
					<div class="card" style="border-radius: 15px;">
						<div class="card-body p-5">
							<h2 class="text-uppercase text-center mb-5">Create an account</h2>
							<form action="registerProcess.jsp" method="post" onsubmit="return checkForm()" name="registerForm">
								<div class="form-outline mb-4">
									<input type="text" name="name" id="inputID" class="form-control form-control-lg" />
									<label class="form-label" for="inputID">Your ID</label>
								</div>
								<div class="form-outline mb-4">
									<input type="password" id="inputPassword" class="form-control form-control-lg" />
									<label class="form-label" for="inputPassword">Password</label>
								</div>
								<div class="form-outline mb-4">
									<input type="password" id="inputPasswordRepeat" class="form-control form-control-lg" />
									<label class="form-label" for="inputPasswordRepeat">Repeat your password</label>
								</div>
								<div class="form-outline mb-4">
									<input type="email" id="inputEmail" class="form-control form-control-lg" />
									<label class="form-label" for="inputEmail">Your Email</label>
								</div>
								<div class="form-outline mb-4">
									<input type="tel" id="inputTelphone" class="form-control form-control-lg" />
									<label class="form-label" for="inputTelphone">Your Tel</label>
								</div>
								<div class="form-outline mb-4">
									<input type="text" id="inputAddress" class="form-control form-control-lg" />
									<label class="form-label" for="inputAddress">Your Address</label>
								</div>
								<div class="d-flex justify-content-center">
									<button type="button"
									        class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Register</button>
								</div>

								<p class="text-center text-muted mt-5 mb-0">Have already an account? <a href="/JSP/login/login.jsp"
								                                                                        class="fw-bold text-body"><u>Login here</u></a></p>
							</form>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<footer>
	<%@ include file="/JSP/include/footer.jsp" %>
</footer>
</body>
</html>
