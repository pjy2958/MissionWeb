<%--
  Created by IntelliJ IDEA.
  User: jyp
  Date: 2022/06/13
  Time: 5:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table border="1" style="width: 100%">
	<tr>
		<td rowspan="2" style="height: 100px; width: 150px">
			<a href="/">
				<img src="/resources/images/logo.png" style="height: 100px; width: 150px"/>
			</a>
		</td>
		<td align="right">
			즐겨찾기
			<c:if test="${not empty member}">
				[${member.id}님이 접속하였습니다]
			</c:if>
		</td>
	</tr>
	<tr>
		<td>
			<nav>
				<c:if test="${member.type == 'S'}">
					회원관리 |
				</c:if>
				<a href="/JSP/board/list.jsp">게시판</a> |
				<c:choose>
					<c:when test="${empty member}">
						회원가입 |
						<a href="/JSP/login/login.jsp">로그인</a> |
					</c:when>
					<c:when test="${not empty member}">
						마이페이지 |
						<a href="/JSP/login/logout.jsp">로그아웃</a>
					</c:when>
				</c:choose>
			</nav>
		</td>
	</tr>
</table>