<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/30
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录(Session监听器统计在线用户)</title>
</head>
<body>
<form action="./os" method="post" name="loginform">
    昵称:<input type="text" name="username" id="username"/><br/>
    密码:<input type="password" name="pwd" id="pwd"/><br/>
    <button type="submit">提交</button>
    <a href="DestorySession.jsp">退出登录</a>
</form>
</body>
</html>
