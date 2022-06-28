<%--
  Created by IntelliJ IDEA.
  User: jyp
  Date: 2022/06/17
  Time: 11:10 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
</head>
<body>
	<h2>파일 업로드 테스트</h2>
	<form action="uploadInfo.jsp" method="post" enctype="multipart/form-data">
		ID : <input type="text" name="id"><br>
		파일 : <input type="file" name="uploadfile" size="50"><br>
		<input type="submit" value="전송">
	</form>
</body>
</html>