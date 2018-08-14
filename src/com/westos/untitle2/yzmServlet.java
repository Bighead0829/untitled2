package com.westos.untitle2;

import org.apache.commons.lang3.RandomUtils;
import sun.awt.image.BufferedImageDevice;

import javax.imageio.ImageIO;
import javax.servlet.GenericServlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import static java.awt.image.ImageObserver.HEIGHT;

@WebServlet(name = "yzmServlet")
public class yzmServlet extends HttpServlet {
    private static final int WIDTH = 100;
    private static final int HEIGHT = 40;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doGet(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        BufferedImage image=new BufferedImage(WIDTH,HEIGHT, BufferedImage.TYPE_INT_RGB);
        Graphics g=image.getGraphics();
        //设置背景色
        g.setColor(Color.CYAN);
        //填充背景色
        g.fillRect(0,0,WIDTH,HEIGHT);
        //设置前景色
        g.setColor(Color.BLACK);
        //设置字体
        Font font=new Font("仿宋",Font.BOLD,20);
        g.setFont(font);
        //获取验证码
        int len=4;
        String result="";
        for(int x=0;x<len;x++){
            char c=(char) RandomUtils.nextInt(65,91);
            result=result+c;
        }
        g.drawString(result,20,20);
        //设置干扰线条
        for(int i=0;i<10;i++){
            int x1= RandomUtils.nextInt(0,WIDTH);
            int x2= RandomUtils.nextInt(0,WIDTH);
            int y1= RandomUtils.nextInt(0,HEIGHT);
            int y2= RandomUtils.nextInt(0,HEIGHT);
            Color color=new Color(RandomUtils.nextInt(0,255),RandomUtils.nextInt(0,255),RandomUtils.nextInt(0,255));
            g.setColor(color);
            //设置线条
            g.drawLine(x1,y1,x2,y2);
        }
        //将获取到的验证码存储到Session中
        HttpSession session=request.getSession();
        session.setAttribute("identifyCode",result);
        //输出图片
        BufferedOutputStream bos=new BufferedOutputStream(response.getOutputStream());
        ImageIO.write(image,"jpg",bos);
        //ImageIO.write(image,"jpg",new File("e:\\b.jpg"));
        bos.flush();
        bos.close();
    }
}
