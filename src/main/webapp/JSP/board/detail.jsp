<%@ page import="java.sql.Connection" %>
<%@ page import="util.ConnectionFactory" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="util.JDBCClose" %>
<%@ page import="kr.ac.kopo.board.dao.BoardDAO" %>
<%@ page import="kr.ac.kopo.board.dao.BoardVO" %>
<%@ page import="kr.ac.kopo.board.dao.BoardFileVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	// 1. no파라미터 추출
	int writeNumber = Integer.parseInt(request.getParameter("no"));  // 글 번호
//	String writeNumber = request.getParameter("no");  // 글 번호

	BoardDAO dao = new BoardDAO();
	// 1. 게시물 조회
	BoardVO board = dao.selectByNo(writeNumber);

	// 2. 첨부파일 조회
	List<BoardFileVO> fileList = new ArrayList<>();
	fileList = dao.selectFileByNo(writeNumber);

	pageContext.setAttribute("board", board);
	pageContext.setAttribute("fileList", fileList);
%>
<!DOCTYPE html>
<html>
<head>
	<title>게시판 상세</title>
	<link rel="stylesheet" href="/resources/css/layout.css">
	<link rel="stylesheet" href="/resources/css/table.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	        crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	      integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<script>
        function doAction(type) {
            switch (type) {
                case 'U' :
                    location.href = "update.jsp?no=${param.no}";
                    break;
                case 'D' :
                    if (confirm('삭제하시겠습니까?')) {
                        location.href = " delete.jsp?no=${param.no}";
                    }
                    break;
                case 'L' :
                    location.href = " list.jsp"
                    break;
            }
        }
	</script>
</head>
<body>
<header>
	<jsp:include page="/JSP/include/topMenu.jsp"/>
</header>
<section class="mt-5 mb-5">
	<div class="container-lg">
		<figure class="text-center">
			<blockquote class="blockquote">
				<p class="h3">${ board.title }</p>
			</blockquote>
			<figcaption class="blockquote-footer">
				${ board.regDate } <cite title="Source Title"> ${ board.writer }</cite> 작성
			</figcaption>
		</figure>
		<div class="card">
			<div class="card-header">
				<div class="text-muted" style="float: left">
					${ board.no }번 글
				</div>
				<div class="text-muted" style="float: right">
					조회수 ${ board.viewCnt }회
				</div>
			</div>
			<div class="card-body">
<%--				<h5 class="card-title"></h5>--%>
				<p class="card-text fs-5" style="min-height: 300px"><c:out value="${board.content}"/></p>
			</div>
			<div class="card-footer text-muted">
				첨부파일
					<c:forEach items="${fileList}" var="fileVO">
						<a href="/upload/${fileVO.fileSaveName}">
								${fileVO.fileOriName}</a>
						(${fileVO.fileSize} bytes)
					</c:forEach>
				<div style="float: right">
					<c:if test="${board.writer eq member.id}">
				<button class="btn btn-secondary" onclick="doAction('U')">수 정</button>&nbsp;&nbsp;
				<button class="btn btn-secondary" onclick="doAction('D')">삭 제</button>&nbsp;&nbsp;
					</c:if>
				<button class="btn btn-secondary" onclick="doAction('L')">목 록</button>
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