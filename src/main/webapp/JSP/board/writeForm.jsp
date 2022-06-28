<%--
  Created by IntelliJ IDEA.
  User: jyp
  Date: 2022/06/02
  Time: 4:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
	<title>JSP - Hello World</title>
	<link rel="stylesheet" href="/resources/css/layout.css">
	<link rel="stylesheet" href="/resources/css/table.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"
	        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script>
        $(document).ready(function () {
            $('#listBtn').click(function () {
                location.href = 'list.jsp'
            })
        })
        // 제목, 작성자, 내용에 빈값이 있는지 확인하는 함수
        function checkForm() {
            let f = document.writeForm

            if (f.title.value == '') {
                f.title.focus()
                alert("제목을 입력하세요.")
                return false;
            }
            // if (f.writer.value == '') {
            //     f.writer.focus()
            //     alert("작성자를 입력하세요.")
            //     return false;
            // }
            if (f.content.value == '') {
                f.content.focus()
                alert("내용을 입력하세요.")
                return false;
            }

            // 첨부파일 확장자 체크
	        if(checkExt(f.attachfile1))
                return false;
            if(checkExt(f.attachfile2))
                return false;
            return true;
        }

        function checkExt(obj) {
            let forbidName = ['exe', 'java', 'class', 'js', 'jsp'];
            let fileName = obj.value;
            let ext = fileName.substring(fileName.lastIndexOf('.') + 1);
            for(let i = 0; i < forbidName.length; i ++) {
                if(forbidName[i] == ext) {
                    alert("파일의 확장자가 규칙에 위배됩니다.")
                    return true;
                }
            }
            return false;
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
		<h2>새글 등록폼</h2>
		<hr>
		<br>
		<%-- onsubmit -> return true / return false --%>
		<form action="write.jsp" method="post" name="writeForm" onsubmit="return checkForm()" enctype="multipart/form-data">
			<table border="1" style="width: 80%">
				<tr>
					<th width="25%">제목</th>
					<td><input type="text" name="title"></td>
				</tr>
				<tr>
					<th width="25%">작성자</th>
					<td><input type="text" name="writer"></td>
				</tr>
				<tr>
					<th width="25%">내용</th>
					<td>
						<textarea rows="5" cols="80" name="content"></textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td>
						<input type="file" name="attachfile1"><br>
						<input type="file" name="attachfile2"><br>
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="등   록">&nbsp;&nbsp;
			<button type="button" id="listBtn">목록</button>
		</form>
	</div>
</section>
<footer>
	<%@ include file="/JSP/include/footer.jsp" %>
</footer>
</body>
</html>