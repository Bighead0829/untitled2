<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/30
  Time: 9:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>在线人数</title>
</head>
<body>
<h1>在线人数:</h1>
<%=application.getAttribute("counter")%>
<a href="DestorySession.jsp">退出登录</a>
</body>
</html>
