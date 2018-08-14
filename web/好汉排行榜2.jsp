<%@ page import="com.westos.web01.bean.Hero" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/28
  Time: 2:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>好汉排行榜2</title>
    <style>
        tr{
            width:100px;
            height:50px;
            text-align:center;
        }
    </style>
</head>
<body>
<%
    //获取好汉排行榜
    List<Hero> list=(List)application.getAttribute("haohan");
    //防止空指针异常
    if(list==null){
        list=new ArrayList();
        application.setAttribute("haohan",list);
    }
    if (list.isEmpty()){
        Hero haohan=new Hero();
        haohan.setNumber(1);
        haohan.setName("宋江");
        list.add(haohan);
    }
%>
<h2>jsp输出</h2>
<table id="herotable" border="1px" cellpadding="0" cellspacing="0" width="600px" height="150px">
    <tr>
        <th>排名</th>
        <th>姓名</th>
        <th>操作</th>
    </tr>
    <%
        for(Hero hero:list){
    %>
    <tr>
        <td><%=hero.getNumber()%></td>
        <td><%=hero.getName()%></td>
        <td><span >删除</span><span >修改</span></td>
    </tr>
    <%
        }
    %>
</table>
<h2>jstl输出</h2>
<table  border="1px" cellpadding="0" cellspacing="0" width="600px" height="150px">
    <tr>
        <th>排名</th>
        <th>姓名</th>
        <th>操作</th>
    </tr>
    <c:forEach var="item" items="${haohan}">
        <tr>
            <td>
                <c:out value="${item.number}"></c:out>
            </td>
            <td>
                <c:out value="${item.name}"></c:out>
            </td>
            <td><span>删除</span><span >修改</span></td>
        </tr>
    </c:forEach>
</table>
<form id="form" name="form" action="./Hero" method="post">
    <p >排名<input type="text" name="number" id="number" ></p>
    <p >姓名<input type="text" name="name" id="name" ></p>
    <button type="submit">添加好汉</button>
</form>
</body>
</html>
