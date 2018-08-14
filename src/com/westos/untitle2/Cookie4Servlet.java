package com.westos.untitle2;

import com.westos.untitle2.CityService.UserService;
import com.westos.untitle2.bean.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Cookie4Servlet")
public class Cookie4Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         response.setCharacterEncoding("utf-8");
         request.setCharacterEncoding("utf-8");
         response.setContentType("text/html;charset=utf-8");
         String username=request.getParameter("username");
         String password=request.getParameter("password");
         UserService userService=new UserService();
         List<User> list=userService.setUser();
         if (username==null||password==null){
            Cookie[] cookie=request.getCookies();
            for (Cookie c:cookie){
                if(c.getName().equals("username")){
                    username=c.getValue();
                }else if(c.getName().equals("password")){
                    password=c.getValue();
                }
            }
        }
        if(username.equals("")||password.equals("")){
            request.getRequestDispatcher("login2.html").forward(request,response);
        }else{
            for(User user:list){
                if(user.getUsername().equals(username)&&user.getPassword().equals(password)){
                    Cookie cookie1=new Cookie("username",username);
                    Cookie cookie2=new Cookie("password",password);
                    cookie1.setMaxAge(60*60);
                    cookie2.setMaxAge(60*60);
                    response.addCookie(cookie1);
                    response.addCookie(cookie2);
                    request.getRequestDispatcher("success.html").forward(request,response);
                }else{
                    request.getRequestDispatcher("login2.html").forward(request,response);
                }
            }
        }
    }
}
