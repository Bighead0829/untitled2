package com.westos;

import org.omg.PortableServer.REQUEST_PROCESSING_POLICY_ID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "identifyYzmServlet")
public class identifyYzmServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         response.setCharacterEncoding("utf-8");
         response.setContentType("text/html;charset=utf-8");
         request.setCharacterEncoding("utf-8");
         //获取输入的用户名
         String username=request.getParameter("username");
        //获取输入的密码
         String password=request.getParameter("password");
         //获取输入的验证码
         String yzm2=request.getParameter("yzm01");
         //获取Session对象中存取的数据
         HttpSession session1=request.getSession();
         String yzm1=(String)session1.getAttribute("identifyCode");
         if(!username.equals("")&&!password.equals("")&&!yzm2.equals("")){
             if(username.equals("Bighead")) {
                 if (password.equals("4214963")) {
                     if (yzm1.equals(yzm2)) {
                         response.getWriter().println("登录成功");
                         //登录成功后跳转到的页面
                         //request.getRequestDispatcher("form01.html").forward(request,response);
                     } else {
                         response.getWriter().println("验证码有误,请重新输入");
                     }
                 } else {
                     response.getWriter().println("密码有误,请重新输入");
                 }
             }else{
                 response.getWriter().println("昵称有误,请重新输入");
             }
        }else{
            response.getWriter().println("昵称或密码或验证码不能为空,请输入");
       }
    }
}
