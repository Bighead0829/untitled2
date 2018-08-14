package com.westos.untitle2;

import com.sun.org.apache.bcel.internal.generic.IF_ACMPEQ;
import org.apache.jasper.tagplugins.jstl.core.If;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet(name = "Cookie3Servlet")
public class Cookie3Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request .setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=uft-8");
        response.setCharacterEncoding("utf-8");
        //创建一个Cookie对象
        Cookie cookie=new Cookie("lasttime",new Date().toString());
        //设置Cookie生命周期
        cookie.setMaxAge(60*60);
        response.addCookie(cookie);
        String s="您是首次访问该网站";
        Cookie[] cs=request.getCookies();
        if(cs!=null){
            for(Cookie c:cs){
                if(c.getName().equals("lasttime")){
                    s="您上次访问该网站的时间是:"+c.getValue();
                }
            }
        }
        response.getWriter().println(s);
    }
}
