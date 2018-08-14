<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/28
  Time: 8:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>doReg2jQuery</title>
</head>
<body>
   <%
       //获取信息
       String username=request.getParameter("username");
       String password=request.getParameter("password");
       Map users=(Map)application.getAttribute("users");
       if(users==null){
           users=new HashMap();
           users.put(username,password);
           //通过application存储信息
           application.setAttribute("username",username);
           out.println("注册成功");
       }else{
           if(users.containsKey(username)){
               out.println("用户名已存在");
           }else{
               users.put(username,password);
               //通过application存储信息
               //application.setAttribute("username",username);
               out.println("注册成功");
           }
       }
   %>
</body>
</html>
