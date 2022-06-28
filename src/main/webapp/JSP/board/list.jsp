<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="util.JDBCClose" %>
<%@ page import="util.ConnectionFactory" %>
<%@ page import="java.util.concurrent.ConcurrentHashMap" %>
<%@ page import="kr.ac.kopo.board.dao.BoardVO" %>
<%@ page import="kr.ac.kopo.board.dao.BoardDAO" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
    작업순서
    1. t_board 테이블에서 전체게시글 조회
    2. 조회된 게시물을 하나씩 웹브라우저 출력
--%>

<%
	BoardDAO dao = new BoardDAO();
	List<BoardVO> list = dao.selectAll();

	// 공유영역 등록
	pageContext.setAttribute("list", list);
%>
<!DOCTYPE html>
<html>
<head>
	<title>게시물 목록</title>
	<link rel="stylesheet" href="/resources/css/layout.css">
	<link rel="stylesheet" href="/resources/css/table.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"
	        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script>
        $(document).ready(function () {
            $('#addBtn').click(function () {
                location.href = 'writeForm.jsp'
            })
        })

        function checkLogin(boardNo) {
            <c:choose>
                <c:when test="${empty member}">
                    if(confirm('로그인 후 사용가능합니다.\n로그인페이지로 이동할까요?'))
                        location.href = '/JSP/login/login.jsp'
                </c:when>
                <c:otherwise>
                    location.href = 'detail.jsp?no=' + boardNo;
                </c:otherwise>
            </c:choose>
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
		<h2>전체게시글 조회</h2>
		<hr>
		<br>
		<table border="1" style="width:100%">
			<tr>
				<th width="7%">번호</th>
				<th>제목</th>
				<th width="16%">작성자</th>
				<th width="20%">등록일</th>
			</tr>
			<c:forEach items="${ list }" var="board" varStatus="loop">
				<tr <c:if test="${loop.count mod 2 eq 0}">class="even"</c:if>>
					<td> ${ board.no } </td>
					<td>
						<a href="javascript:checkLogin(${board.no})">
							<c:out value="${board.title}"/>
						</a>
					</td>
					<td><c:out value=" ${ board.writer }"/></td>
					<td><c:out value="${board.regDate}"/></td>
				</tr>
			</c:forEach>
		</table>
		<br>
		<c:if test="${not empty member}">
			<button id="addBtn">새글 등록</button>
		</c:if>
	</div>
</section>
<footer>
	<%@ include file="/JSP/include/footer.jsp" %>
</footer>
</body>
</html>