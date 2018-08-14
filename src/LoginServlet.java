import sun.plugin2.message.GetAppletMessage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doGet(request,response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        response.getWriter().print("<!DOCTYPE html>\n" +
                "<html lang=\"en\">\n" +
                "<head>\n" +
                "    <meta charset=\"UTF-8\">\n" +
                "    <title>login</title>\n" +
                "</head>\n" +
                "<body>");
        response.getWriter().print("<div >\n" +
                "    <form action=\"\" method=\"Post\" name=\"login\">\n" +
                "        请输入验证码:\n" +
                "        <img src=\"./yzm01\" height=\"32\">\n" +
                "        <input name=\"yzm01\"><br/>\n" +
                "        <button type=\"submit\" value=\"确认\">确认</button><br/>\n" +
                "        昵称:<input name=\"username\" type=\"text\" placeholder=\"请输入昵称\"/><br/>\n" +
                "        密码:<input name=\"password\" type=\"password\" placeholder=\"请输入密码\"/><br/>\n" +
                "        <button type=\"submit\" value=\"登录\">登录</button>\n" +
                "        <button type=\"result\" value=\"重置\">重置</button>\n" +
                "    </form>\n" +
                "</div>");
    }
}
