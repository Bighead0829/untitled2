package com.westos.untitle2.servlet;

import com.westos.untitle2.bean.Hero;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "AddHeroServlet")
public class AddHeroServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        //获取提交的信息
        String number=request.getParameter("number");
        String name=request.getParameter("name");
        //创建一个Hero对象,将获取到的信息复制给该对象
        Hero hero=new Hero();
        hero.setNumber(Integer.valueOf(number));//进行类型转换,否则出现类转换异常
        hero.setName(name);
        //创建application对象,用来存储信息
        ServletContext application=getServletContext();
        //获取列表
        List<Hero> list=(List)application.getAttribute("hero");
        //处理NPE
        if(list==null){
            list=new ArrayList<>();
        }
        //将hero添加到好汉列表中
        list.add(hero);
        application.setAttribute("hero",list);
        //跳转
        response.sendRedirect(request.getContextPath()+"/好汉排行榜vue.jsp");
    }
}
