<%--
  Created by IntelliJ IDEA.
  User: jyp
  Date: 2022/06/12
  Time: 2:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<script src="https://code.jquery.com/jquery-3.6.0.js"
	        integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
	<script>
		function checkForm() {
            let form = document.MemberAddForm

			if(form.id.value == ''){
                form.id.focus()
				alert("아이디를 입력하세요.")
				return false;
			}
            if(form.name.value == ''){
                form.name.focus()
	            alert("이름을 입력하세요.")
	            return false;
            }
            if(form.password.value == ''){
                form.password.focus()
                alert("비밀번호를 입력하세요.")
                return false;
            }
            if(form.passwordCheck.value == ''){
                form.passwordCheck.focus()
                alert("비밀번호를 입력하세요.")
                return false;
            }
            if(form.password.value != form.passwordCheck.value){
                form.passwordCheck.focus()
	            alert("비밀번호가 일치하지 않습니다.")
	            return false;
            }
			if(form.email.value == ''){
                form.email.focus()
				alert("이메일을 입력하세요.")
				return false;
			}
            if(form.tel.value.length != 11){
                form.tel.focus()
	            alert("올바른 휴대폰번호를 입력하세요.")
	            return false;
            }
            if(form.post.value == ''){
                form.post.focus()
	            alert("우편번호를 입력하세요.")
	            return false;
            }
            if(form.basic_addr.value == ''){
                form.basic_addr.focus()
	            alert("기본주소를 입력하세요.")
	            return false;
            }
            if(form.detail_addr.value == ''){
                form.detail_addr.focus()
	            alert("상세주소를 입력하세요.")
	            return false;
            }
            return true;
        }
	</script>
</head>
<body>
<div align="center">
  <hr>
	<h2>회원 등록</h2>
	<hr>
	<form action="memberAdd.jsp" method="post" name="MemberAddForm" onsubmit="return checkForm()">
		아이디 : <input type="text" name="id"><br>
		이름 : <input type="text" name="name"><br>
		비밀번호 : <input type="password" name="password"><br>
		비밀번호 확인 : <input type="password" name="passwordCheck"><br>
		이메일 : <input type="email" name="email"><br>
		휴대폰번호 : <input type="text" name="tel"><br>
		우편번호 : <input type="text" name="post"><br>
		기본주소 : <input type="text" name="basic_addr"><br>
		상세주소 : <input type="text" name="detail_addr"><br>
		<input type="submit" value="등   록">
		<button><a href="memberList.jsp">목록</a></button>
	</form>
</div>
</body>
</html>
