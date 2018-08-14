package com.westos.untitle2;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@javax.servlet.annotation.WebServlet(name = "FirstServlet")
public class FirstServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        System.out.println("doGet");
        response.getWriter().print("<!DOCTYPE html>\n" +
                "<html>\n" +
                "\t<head>\n" +
                "\t\t<meta charset=\"UTF-8\">\n" +
                "\t\t<title>SERVLET</title>\n"+

                "\t</head>\n" +
                "\t<body>");
        response.getWriter().print("NIHAO");
        response.getWriter().print("您选择的省份是:"+request.getParameter("sheng"));
        response.getWriter().print("</body></html>");
    }
}
