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
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
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
<section class="mt-5 mb-5">
	<figure class="text-center">
		<blockquote class="blockquote">
			<p class="h3">게시판</p>
		</blockquote>
		<figcaption class="blockquote-footer">
			I want go home to<cite title="Source Title"> Suwon</cite>
		</figcaption>
	</figure>
	<div class="container position-relative">
	<table class="table">
		<thead class="table-light">
		<tr>
			<th width="7%">번호</th>
			<th>제목</th>
			<th width="16%">작성자</th>
			<th width="20%">등록일</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${ list }" var="board" varStatus="loop">
			<tr>
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
		</tbody>
	</table>
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">
				<li class="page-item disabled">
					<a class="page-link">Previous</a>
				</li>
				<li class="page-item"><a class="page-link" href="#">1</a></li>
				<li class="page-item"><a class="page-link" href="#">2</a></li>
				<li class="page-item"><a class="page-link" href="#">3</a></li>
				<li class="page-item">
					<a class="page-link" href="#">Next</a>
				</li>
			</ul>
		</nav>
		<div class="position-absolute bottom-0 end-0">
			<c:if test="${not empty member}">
				<button type="button" class="btn btn-outline-secondary" id="addBtn">새글 등록</button>
			</c:if>
		</div>
	</div>
</section>
<footer>
	<%@ include file="/JSP/include/footer.jsp" %>
</footer>
</body>
</html>
