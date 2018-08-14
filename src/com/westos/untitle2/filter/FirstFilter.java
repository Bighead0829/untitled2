package com.westos.untitle2.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;
import java.util.Map;

@WebFilter(filterName = "FirstFilter")
public class FirstFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        Map<String,String[]> map=req.getParameterMap();
        System.out.println("filter输出参数开始");
        System.out.println(map);
        System.out.println("filter输出参数结束");
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
