package com.westos.untitle2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "Cookie1Servlet")
public class Cookie1Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         request .setCharacterEncoding("utf-8");
         response.setContentType("text/html;charset=uft-8");
         response.setCharacterEncoding("utf-8");
         String id= UUID.randomUUID().toString();//随机生成一个字符串
        //创建Cookie对象,并设置名称和值
        Cookie cookie=new Cookie("Bighead",id);
        response.addCookie(cookie);
        response.getWriter().println("已发送id");
    }
}
