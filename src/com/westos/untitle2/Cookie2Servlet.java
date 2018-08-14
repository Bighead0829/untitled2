package com.westos.untitle2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Cookie2Servlet")
public class Cookie2Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request .setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=uft-8");
        response.setCharacterEncoding("utf-8");
        Cookie[] cs=request.getCookies();//请求获取Cookie
        if(cs!=null){
            for(Cookie c:cs){//遍历Cookie
                if(c.getName().equals("id")){
                    response.getWriter().println("您的id是:"+c);
                }
            }
        }
    }
}
