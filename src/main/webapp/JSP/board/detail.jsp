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
	<script>
        function doAction(type) {
            switch (type) {
                case 'U' :
                    location.href = "update.jsp?no=${param.no}";
                    break;
                case 'D' :
                    if (confirm('삭제하시겠습니까?')) {
                        location.href = "delete.jsp?no=${param.no}";
                    }
                    break;
                case 'L' :
                    location.href = "list.jsp"
                    break;
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
		<h2>게시판 상세</h2>
		<hr>
		<br>
		<table border="1" style="width: 80%">
			<%--	3.화면 추출 --%>
			<tr>
				<th width="25%">번호</th>
				<td>${ board.no }</td>
			</tr>
			<tr>
				<th width="25%">제목</th>
				<td>${ board.title }</td>
			</tr>
			<tr>
				<th width="25%">작성자</th>
				<td>${ board.writer }</td>
			</tr>
			<tr>
				<th width="25%">내용</th>
				<td><c:out value="${board.content}"/></td>
			</tr>
			<tr>
				<th width="25%">조회수</th>
				<td>${ board.viewCnt }</td>
			</tr>
			<tr>
				<th width="25%">등록일</th>
				<td>${ board.regDate }</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<c:forEach items="${fileList}" var="fileVO">
						<a href="/upload/${fileVO.fileSaveName}">
						${fileVO.fileOriName}</a>
						(${fileVO.fileSize} bytes)
					</c:forEach>
				</td>
			</tr>
		</table>
		<br>
		<button onclick="doAction('U')">수 정</button>&nbsp;&nbsp;
		<button onclick="doAction('D')">삭 제</button>&nbsp;&nbsp;
		<button onclick="doAction('L')">목 록</button>&nbsp;&nbsp;
	</div>
</section>
<footer>
	<%@ include file="/JSP/include/footer.jsp" %>
</footer>
</body>
</html>