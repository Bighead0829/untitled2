package com.westos.untitle2.filter;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "SecondFilter")
public class SecondFilter implements Filter {
    public void destroy() {
    }


    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        //检查用户是否登录
        //if(((HttpServletRequest).req).getSession().getAttribute("username")!=null){
            //用户已登录
            //chain.doFilter(req, resp);
       //}else{
            //用户名未登录
           //String url=((HttpServletRequest).req).getRequestURI();

          // if(StringUtils.endsWith(url,"login2.html")){
               //继续请求
              chain.doFilter(req, resp);
           // }else{
               // ((HttpServletResponse).resp).sendRi
           // }
       // }
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
