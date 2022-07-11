<%--
  Created by IntelliJ IDEA.
  User: jyp
  Date: 2022/07/06
  Time: 6:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
        crossorigin="anonymous"></script>
<html>
<head>
	<title>myPage</title>
</head>
<body>
<header>
	<jsp:include page="/JSP/include/topMenu.jsp"/>
</header>
<section>
	<div class="container h-50">
		<div class="row d-flex justify-content-center align-items-center h-100">
			<div class="col col-md-9 col-lg-7 col-xl-5">
				<div class="card" style="border-radius: 15px;">
					<div class="card-body p-4">
						<div class="d-flex text-black">
							<div class="flex-shrink-0">
								<img src="/resources/images/bono.jpeg"
								     alt="/resources/images/lion.png" class="img-fluid"
								     style="width: 180px; height: 250px; border-radius: 10px;">
							</div>
							<div class="flex-grow-1 ms-3">
								<h5 class="mb-1">${member.name}</h5>
								<p class="mb-0 pb-0"
								   style="color: #2b2a2a;">${member.email_id}@${member.email_domain}</p>
								<p class="mb-2 pb-1"
								   style="color: #2b2a2a;">${member.tel1}-${member.tel2}-${member.tel3}</p>
								<div class="d-flex justify-content-start rounded-3 p-2 mb-2"
								     style="background-color: #efefef;">
									<div>
										<p class="small text-muted mb-1">ID</p>
										<p class="mb-0">${member.id}</p>
									</div>
									<div class="px-5">
										<p class="small text-muted mb-1">Password</p>
										<p class="mb-0">${member.password}</p>
									</div>
									<div class="px-0">
										<p class="small text-muted mb-1">등급</p>
										<c:if test="${member.type eq 'S'}">
											<p class="mb-0">관리자</p>
										</c:if>
										<c:if test="${member.type eq 'U'}">
											<p class="mb-0">일반회원</p>
										</c:if>
									</div>
								</div>
								<div class="f-flex pt-1">
									<p class="small text-muted mb-0">집주소</p>
									<p class="small mb-1">${member.basic_addr} ${member.detail_addr}</p>
								</div>
								<div class="f-flex pt-1">
									<p class="small text-muted mb-0">회원가입일</p>
									<p class="small mb-1">${member.reg_date}</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</section>
<footer>
	<jsp:include page="/JSP/include/footer.jsp"/>
</footer>
<footer>

</footer>
</body>
</html>
