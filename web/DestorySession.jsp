<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/30
  Time: 9:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>退出登录</title>
</head>
<body>
<%
    session.invalidate();
%>
</body>
</html>
