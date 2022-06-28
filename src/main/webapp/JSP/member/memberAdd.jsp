<%@ page import="kr.ac.kopo.member.dao.MemberVO" %>
<%@ page import="kr.ac.kopo.member.dao.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: jyp
  Date: 2022/06/12
  Time: 3:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	request.setCharacterEncoding("utf-8");
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String password = request.getParameter("password");

	String email = request.getParameter("email");
    String email_id = email.split("@")[0];
    String email_domain = email.split("@")[1];

    String tel = request.getParameter("tel");
    String tel1 = tel.substring(0, 3);
    String tel2 = tel.substring(3, 7);
    String tel3 = tel.substring(7, 11);
    String post = request.getParameter("post");
    String basic_addr = request.getParameter("basic_addr");
    String detail_addr = request.getParameter("detail_addr");
	MemberVO member = new MemberVO(id, name, password, email_id, email_domain, tel1, tel2, tel3, post, basic_addr, detail_addr);
	MemberDAO dao = new MemberDAO();
    dao.memberInsert(member);
%>
<script>
	alert("멤버 추가를 완료했습니다.")
	location.href="memberList.jsp";
</script>