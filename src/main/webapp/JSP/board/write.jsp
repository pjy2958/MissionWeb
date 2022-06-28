<%@ page import="java.sql.Connection" %>
<%@ page import="util.ConnectionFactory" %>
<%@ page import="java.lang.String" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="kr.ac.kopo.board.dao.BoardVO" %>
<%@ page import="kr.ac.kopo.board.dao.BoardDAO" %>
<%@ page import="util.KopoFileNamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.io.File" %>
<%@ page import="kr.ac.kopo.board.dao.BoardFileVO" %><%--
  Created by IntelliJ IDEA.
  User: jyp
  Date: 2022/06/02
  Time: 5:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	/*
		작업순서
		1. 파라밑 추출(제목, 작성자, 내용)
		2. t_board 테이블에 새로운게시글 삽입
		3. 클라이언트에게 결과 전송
	 */

	request.setCharacterEncoding("utf-8");
	String saveFolder = "/Users/jyp/Documents/Mission-Web/src/main/webapp/upload"; // 원래는 탐캣서버에 위치해야함
	MultipartRequest multi = new MultipartRequest(request, saveFolder, 1024 * 1024 * 3, "utf-8", new KopoFileNamePolicy());

	// 1.게시판 저장
	String title = multi.getParameter("title");
	String writer = multi.getParameter("writer");
	String content = multi.getParameter("content");

	BoardVO board = new BoardVO();
	board.setTitle(title);
	board.setWriter(writer);
	board.setContent(content);

	BoardDAO dao = new BoardDAO();

	// 등록할 글번호 조회
	int boardNo = dao.selectBoardNo();
	board.setNo(boardNo);

	dao.insertBoard(board);

	// 2.첨부파일 저장
	Enumeration<String> files = multi.getFileNames();
	while (files.hasMoreElements()) {
		String fileName = files.nextElement();
		File f = multi.getFile(fileName);

		if (f != null) {
			String fileOriName = multi.getOriginalFileName(fileName);
			String fileSaveName = multi.getFilesystemName(fileName);
			int fileSize = (int) f.length();

			BoardFileVO fileVO = new BoardFileVO();
			fileVO.setFileOriName(fileOriName);
			fileVO.setFileSaveName(fileSaveName);
			fileVO.setFileSize(fileSize);
			fileVO.setBoardNo(boardNo);

			dao.insertBoardFile(fileVO);
		}
	}
    /*    String title = request.getParameter("title");
    String writer = request.getParameter("writer");
    String content = request.getParameter("content");

    BoardVO board = new BoardVO();
    board.setTitle(title);
    board.setWriter(writer);
    board.setContent(content);

    BoardDAO dao = new BoardDAO(); */
	//dao.insertBoard(board);
%>
<script>
    alert('새글등록을 완료하였습니다.')
    location.href = "list.jsp"
</script>