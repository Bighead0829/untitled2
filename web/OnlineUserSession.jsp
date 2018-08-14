<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/30
  Time: 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线用户显示</title>
</head>
<body>
<h3>在线用户</h3>
<%
    //获取在线用户列表
    List<String> onlineUser=(List<String>)request.getServletContext().getAttribute("onlineUser");
%>
<!--输出在线用户数-->
在线用户数量:<%=application.getAttribute("counter")%><br/>
<%
    //遍历用户名列表
    for (String un:onlineUser){
%>
在线用户名:
<ul>
    <li><%=un%></li>
</ul>
<%
    }
%>
</body>
</html>
