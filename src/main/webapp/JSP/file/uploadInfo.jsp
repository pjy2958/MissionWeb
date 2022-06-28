<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.BufferedReader" %><%--
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
<%
	InputStreamReader isr = new InputStreamReader(request.getInputStream(), "utf-8");
	BufferedReader br = new BufferedReader(isr);

    while(true) {
        String buf = br.readLine();
        if(buf == null) break;
        out.write(buf + "<br>");
    }
%>
</body>
</html>
