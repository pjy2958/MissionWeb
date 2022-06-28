package kr.ac.kopo.servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.Arrays;

public class PInfoResult extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String[] mail = request.getParameterValues("mail");
        String job = request.getParameter("job");


        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();


        out.println("<html>");
        out.println("  <head>");
        out.println("      <title>메소드 요청방식</title>");
        out.println("  </head>");
        out.println("<body>");

        out.println("<h1>개인 정보 출력</h1>");
        out.println("이름 : " + name + "<br>");
        out.println("아이디 : " + id + "<br>");
        out.println("암호 : " + password + "<br>");
        out.println("성별 : " + gender + "<br>");
        if(Arrays.asList(mail).contains("noticeMail"))
            out.println("공지메일 : 받음<br>");
        else
            out.println("공지메일 : 받지않음<br>");
        if(Arrays.asList(mail).contains("advertiseMail"))
            out.println("광고메일 : 받음<br>");
        else
            out.println("광고메일 : 받지않음<br>");
        if(Arrays.asList(mail).contains("deliveryCheckMail"))
            out.println("배달 확인 메일 : 받음<br>");
        else
            out.println("배달 확인 메일 : 받지않음<br>");
        out.println("직업 : " + job + "<br>");

        out.println("</body>");
        out.println("</html>");
    }
}
