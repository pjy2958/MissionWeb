<%@ page import="kr.ac.kopo.member.dao.MemberVO" %>
<%@ page import="kr.ac.kopo.member.dao.MemberDAO" %><%--
  Created by IntelliJ IDEA.
  User: jyp
  Date: 2022/06/14
  Time: 2:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	String password = request.getParameter("password");

	MemberVO memberVO = new MemberVO();
	memberVO.setId(id);
	memberVO.setPassword(password);

	MemberDAO dao = new MemberDAO();
	MemberVO member = dao.login(memberVO);

	String msg = "";
	String url = "";
	if (member == null) {
		msg = "아이디 또는 패스워드를 잘못 입력했습니다.";
		url = "login.jsp";
	} else {
		switch (member.getType()) {
			case "S":
				msg = "관리자님 환영합니다.";
				break;
			case "U":
				msg = member.getId() + "님 환영합니다.";
				break;
		}
		url = "/";
        session.setAttribute("member", member);
	}
	pageContext.setAttribute("msg", msg);
	pageContext.setAttribute("url", url);
%>
<script>
    alert('${msg}')
    location.href = '${url}'
</script>

