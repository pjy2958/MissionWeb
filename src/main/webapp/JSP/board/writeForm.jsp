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
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="Colorlib Templates">
	<meta name="author" content="Colorlib">
	<meta name="keywords" content="Colorlib Templates">
	<title>JSP - Hello World</title>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	        integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	        crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
	      integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i" rel="stylesheet">
	<link href="/resources/css/main.css" rel="stylesheet" media="all">
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
            if (checkExt(f.attachfile1))
                return false;
            if (checkExt(f.attachfile2))
                return false;
            return true;
        }

        function checkExt(obj) {
            let forbidName = ['exe', 'java', 'class', 'js', 'jsp'];
            let fileName = obj.value;
            let ext = fileName.substring(fileName.lastIndexOf('.') + 1);
            for (let i = 0; i < forbidName.length; i++) {
                if (forbidName[i] == ext) {
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
<%--<section>--%>
<%--		<div align="center">--%>
<%--			<hr>--%>
<%--			<h2>새글 등록폼</h2>--%>
<%--			<hr>--%>
<%--			<br>--%>
<%--			&lt;%&ndash; onsubmit -> return true / return false &ndash;%&gt;--%>
<%--			<form action="write.jsp" method="post" name="writeForm" onsubmit="return checkForm()"--%>
<%--			      enctype="multipart/form-data">--%>
<%--				<table border="1" style="width: 80%">--%>
<%--					<tr>--%>
<%--						<th width="25%">제목</th>--%>
<%--						<td><input type="text" name="title"></td>--%>
<%--					</tr>--%>
<%--					<tr>--%>
<%--						<th width="25%">작성자</th>--%>
<%--						<td><input type="text" name="writer"></td>--%>
<%--					</tr>--%>
<%--					<tr>--%>
<%--						<th width="25%">내용</th>--%>
<%--						<td>--%>
<%--							<textarea rows="5" cols="80" name="content"></textarea>--%>
<%--						</td>--%>
<%--					</tr>--%>
<%--					<tr>--%>
<%--						<th>첨부파일</th>--%>
<%--						<td>--%>
<%--							<input type="file" name="attachfile1"><br>--%>
<%--							<input type="file" name="attachfile2"><br>--%>
<%--						</td>--%>
<%--					</tr>--%>
<%--				</table>--%>
<%--				<br>--%>
<%--				<input type="submit" value="등   록">&nbsp;&nbsp;--%>
<%--				<button type="button" id="listBtn">목록</button>--%>
<%--			</form>--%>
<%--		</div>--%>
<%--</section>--%>

<div class="page-wrapper p-t-100 p-b-50">
	<div class="wrapper wrapper--w900">
		<div class="card card-6">
			<div class="card-heading">
				<h2 class="p-3">새글 등록폼</h2>
			</div>
			<div class="card-body">
				<form action="write.jsp" method="post" name="writeForm" onsubmit="return checkForm()" enctype="multipart/form-data">
					<div class="form-row">
						<div class="name">제 목</div>
						<div class="value">
							<input class="input--style-6" name="title" type="text" placeholder="제목을 입력하세요.">
						</div>
					</div>
					<div class="form-row">
						<div class="name">작 성 자</div>
						<div class="value">
							<div class="input-group">
								<input class="input--style-6" type="text" name="writer" value="${member.id}" placeholder="${member.id}" readonly>
							</div>
						</div>
					</div>
					<div class="form-row">
						<div class="name">내 용</div>
						<div class="value">
							<div class="input-group">
								<textarea class="textarea--style-6" name="content" placeholder="내용을 입력하세요."></textarea>
							</div>
						</div>
					</div>
					<div class="form-row">
						<div class="name">첨 부 파 일</div>
						<div class="value">
							<div class="input-group js-input-file mt-3">
								<input class="input-file" type="file" name="attachfile1" id="file">
								<label class="label--file" for="file">Choose file</label>
								<span class="input-file__info">No file chosen</span>
							</div>
							<div class="label--desc">Upload your file/Resume or any other relevant file.</div>
						</div>
					</div>
					<div class="card-footer" align="center">
						<button class="btn btn--radius-2 btn--blue-2 bg-dark text-white" type="submit">새 글 등 록</button>
						<button class="btn btn--radius-2 btn--blue-2 bg-dark text-white" type="button" id="listBtn">목 록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<footer>
	<%@ include file="/JSP/include/footer.jsp" %>
</footer>
</body>
</html>