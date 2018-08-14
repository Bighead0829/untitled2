package com.westos;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "GetIPServlet")
public class GetIPServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String ip=request.getRemoteAddr();
         response.getWriter().println(ip);
         if(ip.equals("127.0.0.1")){
             response.getWriter().println("hello"+ip);
         }else{
             response.getWriter().println("您的ip已被禁止");
         }
    }
}
