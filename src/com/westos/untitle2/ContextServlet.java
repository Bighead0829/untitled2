package com.westos.untitle2;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ContextServlet")
public class ContextServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
       ServletContext sct=getServletContext();
       //sct=getServletContext();
       sct.setAttribute("sctname","bighead");
       //获取计数器的值
        Integer counter=(Integer)sct.getAttribute("counter");
        if(counter==null){
            counter=1;
        }else{
            counter=counter+1;
        }
        sct.setAttribute("counter",counter);
        response.getWriter().println("您是第"+counter+"访问本网站的用户");
        response.getWriter().println("您的ip地址是:"+request.getRemoteAddr());
    }
}
