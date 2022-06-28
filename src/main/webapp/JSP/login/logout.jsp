<%--
  Created by IntelliJ IDEA.
  User: jyp
  Date: 2022/06/14
  Time: 4:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
	session.invalidate();
%>
<script>
	alert("로그아웃하였습니다.");
	location.href="/";
</script>