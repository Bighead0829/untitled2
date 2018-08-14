<%@ page import="java.util.Map" %>
<%@ page import="com.alibaba.fastjson.JSONObject" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="com.alibaba.fastjson.JSON" %>
<%@ page import="com.alibaba.fastjson.serializer.SerializerFeature" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/25
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    //获取提交的数据
    String number=request.getParameter("number");
    String name=request.getParameter("name");
    //创建map集合,用来存储好汉信息,获取的好汉信息
    Map heros=(Map)application.getAttribute("heros");
    //创建json对象
    JSONObject jb=new JSONObject();
    //处理npe
    if(heros==null){
        heros=new HashMap();
        heros.put(number,name);
        jb.put("msg","添加成功");
    }else{
        if(heros.containsKey(number)){
            jb.put("msg","该排名好汉已存在");
        }else{
            heros.put(number,name);
            jb.put("msg","添加成功");
        }
    }
    //将数据添加到json对象中
    jb.put("heros",heros);
    //将数据保存到application对象中
    application.setAttribute("heros",heros);
    //以流的形式输出json对象
    out.println(JSON.toJSONString(jb, SerializerFeature.WriteSlashAsSpecial));
%>


