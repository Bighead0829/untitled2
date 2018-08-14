package com.westos.untitle2.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.*;
import java.util.ArrayList;
import java.util.List;

@WebListener()
public class SessionListener implements ServletContextListener,
        HttpSessionListener, HttpSessionAttributeListener {
    //创建计数变量
    private int counter=0;
    //创建session对象
    private HttpSession session=null;

    // Public constructor is required by servlet spec
    public SessionListener() {
    }


    public void contextInitialized(ServletContextEvent sce) {

    }

    public void contextDestroyed(ServletContextEvent sce) {

    }


    public void sessionCreated(HttpSessionEvent se) {
        /* Session is created. */
        //计数加一
        counter++;
        //初始化session对象
        this.session=se.getSession();
        //将每次创建的session对象绑定到ServletContext中,这样可以保证随时访问
        ServletContext sc=session.getServletContext();
        //创建列表属性,用来存储在线用户
        sc.setAttribute("onlineUser",new ArrayList<String>());
        //并将新的计数变量添加到sc中
        sc.setAttribute("counter",counter);
    }

    public void sessionDestroyed(HttpSessionEvent se) {
        //销毁后counter减一
        counter--;
        //将session对象绑定到ServletContext中,保证随时访问
        ServletContext sc=session.getServletContext();
        //获取在线列表
        List<String> onlineUser=(List<String>)sc.getAttribute("onlineUser");
        //获取用户名
        String username=(String)sc.getAttribute("username");
        //删除该用户名
         onlineUser.remove(username);
        //将删除后用户名的列表重新添加到Session中
        sc.setAttribute("onlineUser",onlineUser);
        //将新的计数变量添加到ServletContext中
        sc.setAttribute("counter",counter);
    }



    public void attributeAdded(HttpSessionBindingEvent sbe) {
        //将session对象绑定到ServletContext中,保证随时访问
        ServletContext sc=session.getServletContext();
        //获取列表
        List<String> onlineUser=(List<String>)sc.getAttribute("onlineUser");
        //判断存储到session中的是否为用户名,如果为用户名,则添加到列表中
        if("username".equals(sbe.getName())){
            onlineUser.add((String)sbe.getValue());
        }
        //将添加后的列表重新添加到Servlet Context中
        sc.setAttribute("onlineUser",onlineUser);
    }

    public void attributeRemoved(HttpSessionBindingEvent sbe) {

    }

    public void attributeReplaced(HttpSessionBindingEvent sbe) {

    }
}
