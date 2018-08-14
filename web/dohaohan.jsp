<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="com.alibaba.fastjson.serializer.SerializerFeature" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/2
  Time: 0:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%
  request.setCharacterEncoding("utf-8");
     response.setCharacterEncoding("utf-8");
   response.setContentType("text/html;charset=UTF-8");
%>--%>
<%

    //相当于写的是servlet界面

    //获取三个传过来的值
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String chuohao = request.getParameter("chuohao");
    //将name和chuohao打包在一起变成数组
    String[] s = {name,chuohao};
    //获取存储的好汉
    Map haohan =(Map) application.getAttribute("haohan");
    JSONObject json=new JSONObject();
    if(haohan==null){
        haohan = new HashMap();
        haohan.put(id,s);
        json.put("msg","用户名不存在,注册成功");

    }
    //否则要直接添加数据
    else{
        if(haohan.containsKey(id)){
            //添加数据
            json.put("msg","用户名已存在");

        }
        else {
            haohan.put(id,s);
            json.put("msg","用户名不存在");
        }
    }
    json.put("haohan",haohan);
    //保存数据到application
    application.setAttribute("haohan",haohan);
    out.println(JSON.toJSONString(json, SerializerFeature.WriteSlashAsSpecial));

%>

