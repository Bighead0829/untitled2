package com.westos.untitle2.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "onlineServlet")
public class onlineServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        //通过请求参数获取用户名
        String username=request.getParameter("username");
        //将获取到的用户名添加到session中
        //用户名不为空时添加
        if(username!=null&&!username.equals("")){
            request.getSession().setAttribute("username",username);
        }
        //添加后跳转到统计用户在线数量页面
        response.sendRedirect(request.getContextPath()+"/OnlineUserSession.jsp");
    }
}
