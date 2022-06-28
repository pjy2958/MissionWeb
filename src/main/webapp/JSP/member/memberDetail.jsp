<%@ page import="kr.ac.kopo.member.dao.MemberDAO" %>
<%@ page import="kr.ac.kopo.member.dao.MemberVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = request.getParameter("id");
	MemberDAO dao = new MemberDAO();
    MemberVO member = dao.memberDetailInfo(id);
    pageContext.setAttribute("member", member);
%>
<html>
<head>
	<title>회원 상세 정보 페이지</title>
	<script>
		function doAction(type) {
            switch (type){
	            case 'U' :
                    location.href="memberUpdate.jsp?id=${param.id}";
		            break;
	            case 'D' :
                    if (confirm('회원탈퇴를 진행하시겠습니까?')) {
                        location.href = "memberDelete.jsp?id=${param.id}";
                    }
                    break;
	            case 'L' :
                    location.href="memberList.jsp";
                    break;
            }
		}
	</script>
</head>
<body>
<div align="center">
	<hr>
	<h2>회원 상세 정보</h2>
	<hr>
	아이디 : ${member.id}<br>
	이름 : ${member.name}<br>
	비밀번호 : ${member.password}<br>
	이메일 : ${member.email_id}@${member.email_domain}<br>
	전화번호 : ${member.tel1}-${member.tel2}-${member.tel3}<br>
	주소 : ${member.basic_addr} ${member.detail_addr}<br>
	타입 : ${member.type}<br>
	등록일 : ${member.reg_date}<br>
	<br>
	<button onclick="doAction('U')">정보수정</button>
	<button onclick="doAction('D')">회원탈퇴</button>
	<button onclick="doAction('L')">돌아가기</button>
</div>
</body>
</html>
