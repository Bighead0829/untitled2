<%@ page import="java.util.Date" %>
<%@ page import="com.westos.untitle2.bean.Shengfen" %>
<%@ page import="com.westos.untitle2.CityService.CityService" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page import="static java.lang.Thread.sleep" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/24
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>jsp01</title>
</head>
<body>
<%
    Date d=new Date();
    out.println("今天是:"+d+","+d.getDay()+","+d.getTime());
%>
<%--
   生成been组件
--%>
<jsp:useBean id="student" scope="application" class="rmg.student"/>
<%=student.getName()%><br>
<%student.setName("Bighaed");%><br>

<%--
用getProperty动作来返回bean组件的属性值
--%>
<jsp:getProperty name="student" property="class"/><br>
<jsp:getProperty name="student" property="name"/><br>

<%--
取属性值
--%>
<%=student.getName()%>

</body>
</html>
