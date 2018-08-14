package com.westos.untitle2;

import com.westos.untitle2.bean.User;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "regServlet")
public class regServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        //获取提交的信息
        String name=request.getParameter("username");
        String password=request.getParameter("password");
        //将提交的信息添加到List
        User user=new User();
        user.setUsername(name);
        user.setPassword(password);
        //获取用户列表
        ServletContext application=getServletContext();
        List<User> list=(List)application.getAttribute("user");
        //检查空指针异常
        if(list==null){
            list=new ArrayList<>();
        }
        list.add(user);
        //将
    }
}
