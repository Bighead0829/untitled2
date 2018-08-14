<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="com.alibaba.fastjson.serializer.SerializerFeature" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/29
  Time: 2:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    //接收用户名和密码
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    Map users = (Map) application.getAttribute("users");
    JSONObject json=new JSONObject();
    if(users==null){
        users=new HashMap();
        users.put(username,password);
        application.setAttribute("users",users);
        json.put("msg","用户名不存在,注册成功");
    }else{
        if(users.containsKey(username)){
            json.put("msg","用户名已存在");
        }else{
            //注册用户
            users.put(username,password);
            json.put("msg","用户名不存在");
        }
    }
    json.put("users",users);
    out.println(JSON.toJSONString(json, SerializerFeature.WriteSlashAsSpecial));


%>
</body>
</html>
