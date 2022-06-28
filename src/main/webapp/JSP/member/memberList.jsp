<%@ page import="java.sql.Connection" %>
<%@ page import="util.ConnectionFactory" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="util.JDBCClose" %>
<%@ page import="kr.ac.kopo.member.dao.MemberDAO" %>
<%@ page import="kr.ac.kopo.member.dao.MemberVO" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    MemberDAO dao = new MemberDAO();
    List<MemberVO> memberList = dao.selectAll();

    pageContext.setAttribute("memberList", memberList);
%>

<!DOCTYPE html>
<html>
<head>
    <title>회원 리스트</title>
    <style>
        td {
            padding-left: 3px;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.js"
            integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
<div align="center">
    <hr>
    <h2>전체 회원 조회</h2>
    <hr>
    <table border="1" style="width: 80%">
        <tr style="text-align: center">
            <th width="10%">아이디</th>
            <th width="10%">이름</th>
            <th width="50%">이메일</th>
            <th>타입</th>
            <th width="20%">등록일</th>
        </tr>
        <c:forEach items="${memberList}" var="member">
        <tr style="text-align: center">
            <td><a href="memberDetail.jsp?id=${member.id}"> ${member.id}</a></td>
            <td>${member.name}</td>
            <td>${member.email_id}@${member.email_domain}</td>
            <td>${member.type}</td>
            <td>${member.reg_date}</td>
        </tr>
        </c:forEach>
    </table>
    <div style="width: 80%">
        <button style="float: left"><a href="memberAddForm.jsp">회원 등록</a></button>
    </div>
</div>

</body>
</html>
