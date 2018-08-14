package com.westos.untitle2;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;

@WebServlet(name = "ResponsServlet")
public class ResponsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;Charset='UTF-8'");
        request.setCharacterEncoding("utf-8");
        //response.getWriter().println("nihao ");
        response.setContentType("image/PNG");
        String filename=request.getParameter("filename");
        File file=new File(filename);
        InputStream is=new FileInputStream(file);
        OutputStream os=response.getOutputStream();
        byte[] b=new byte[1024];
        while(is.read(b)>0){
            os.write(b);
        }
        is.close();
        os.flush();
        os.close();

    }
}
