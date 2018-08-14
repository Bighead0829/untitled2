<%@ page import="java.util.Map" %>
<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="com.alibaba.fastjson.serializer.SerializerFeature" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="org.apache.commons.io.IOUtils" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/2
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>doreg4</title>
</head>
<body>
<%
   //接收用户名和密码
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    //检查是键值对方式提交还是json格式提交
    if(username==null){
        //JSON数据的接收
        //按照流的方式接收
        //获取输入流
        InputStream in = request.getInputStream();
        //将输入流转换为字符串
        String jsonstr = IOUtils.toString(in, "utf-8");
        //将json字符串转换为json对象

        JSONObject jsonobj = JSON.parseObject(jsonstr);

        //从jsonobj中获取需要的参数,注意jsonobj的npe问题
        // username: 客户端提交的json串的key
        username=jsonobj.getString("username");
        password=jsonobj.getString("password");
    }
   //创建Map集合
    Map users=(Map)application.getAttribute("users");
   //创建Json对象
    JSONObject jb=new JSONObject();
   //处理npe
    if(users==null){
        users=new HashMap();
        users.put(username,password);
        //将users保存在application中
        application.setAttribute("users",users);
        jb.put("msg","注册成功");
    }else{
        //如果users已存在
        if(users.containsKey(username)){
            jb.put("msg","用户名已存在,注册失败");
        }else{
            users.put(username,password);
            jb.put("msg","注册成功");
        }
    }
   //将users添加到json对象中
    jb.put("users",users);
    out.println(JSON.toJSONString(jb,SerializerFeature.WriteSlashAsSpecial));
%>
</body>
</html>
