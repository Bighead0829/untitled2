package com.westos.untitle2;

import org.apache.commons.lang3.RandomUtils;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;

import static java.awt.image.ImageObserver.WIDTH;

@WebServlet(name = "SessionServlet")
public class SessionServlet extends HttpServlet {


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name=request.getParameter("name");

        String pass=request.getParameter("pass");



        response.setContentType("text/html;charset=GBK");

        PrintWriter out=response.getWriter();

        out.println("<html>");

        out.println("<head>");

        out.println("<title>登陆提示</title>");

        out.println("<link rel=\"stylesheet\" type=\"text/css\" href=\"../css/register.css\">");

        out.println("</head>");

        out.println("<body>");

        out.println("<div id=\"top\">");

        out.println("<p><h1 align=center>登陆提示...</h1>");

        if(name.equals("admin") && pass.equals("admin")){

            out.println("<p><h1>登陆成功！</h1>");

//测试session

            out.println("<p><a href='testsession'>请点击测试session</a>");

            HttpSession session=request.getSession();

            session.setAttribute("name",name);

        }else{

            out.println("<p><h1>登陆失败！</h1>");

        }

        out.println("</div>");

        out.println("</body>");

        out.println("</html>");




    }
}



