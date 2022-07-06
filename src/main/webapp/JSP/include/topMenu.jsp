<%--
  Created by IntelliJ IDEA.
  User: jyp
  Date: 2022/06/13
  Time: 5:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
<nav class="navbar navbar-expand-lg navbar-light bg-white py-3 border-bottom border-lightgrey border-opacity-50 border-3">
	<div class="container">
		<a class="navbar-brand" href="/" rel="tooltip" title="Designed and Coded by Creative Tim" data-placement="bottom">
			Home
		</a>
		<button class="navbar-toggler shadow-none ms-2" type="button" data-bs-toggle="collapse" data-bs-target="#navigation" aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon mt-2">
          <span class="navbar-toggler-bar bar1"></span>
          <span class="navbar-toggler-bar bar2"></span>
          <span class="navbar-toggler-bar bar3"></span>
        </span>
		</button>
		<div class="collapse navbar-collapse w-100 pt-3 pb-2 py-lg-0 ms-lg-12 ps-lg-5" id="navigation">
			<ul class="navbar-nav navbar-nav-hover ms-auto">
				<ul class="navbar-nav justify-content-center flex-grow-1">
					<c:if test="${member.type == 'S'}">
						<li class="nav-item me-3">
							<a class="nav-link" href="#">
								회원관리
							</a>
						</li>
					</c:if>
					<li class="nav-item me-3">
						<a class="nav-link" href="/JSP/board/list.jsp">
							게시판
						</a>
					</li>
					<c:choose>
						<c:when test="${empty member}">
							<li class="nav_item me-3">
								<a class="nav-link" href="#">
									회원가입
								</a>
							</li>
							<li class="nav_item me-3">
								<a class="nav-link" href="/JSP/login/login.jsp">
									로그인
								</a>
							</li>
						</c:when>
						<c:when test="${not empty member}">
							<li class="nav_item me-3">
								<a class="nav-link" href="#">
									마이페이지
								</a>
							</li>
							<li class="nav_item me-3">
								<a class="nav-link" href="/JSP/login/logout.jsp">
									로그아웃
								</a>
							</li>
						</c:when>
					</c:choose>
					<li class="nav-item ms-lg-auto">
						<a class="nav-link nav-link-icon me-2" href="https://github.com/" target="_blank">
							<p class="d-inline text-sm z-index-1 font-weight-bold" data-bs-toggle="tooltip" data-bs-placement="bottom" title="Star us on Github">Github</p>
						</a>
					</li>
					<c:if test="${not empty member}">
						<li class="nav-item my-auto me-2 ms-lg-auto">
							<p class="d-inline text-sm z-index-1 font-weight-bold" data-bs-placement="bottom" title="Star us on Github">
								[${member.id}님이 접속하였습니다]
							</p>
						</li>
					</c:if>
				</ul>
			</ul>
		</div>
	</div>
</nav>