<%@ page import="com.westos.web01.bean.Hero" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/2
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>好汉排行榜vue2</title>
</head>
<body>
<div id="heroTable1">
    <table  border="1px" cellpadding="0" cellspacing="0" width="600px" height="150px">
        <thead>
        <tr>
            <th>排名</th>
            <th>姓名</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <%
            for(Hero h:list){
        %>
        <tr>
            <td><%=h.getNumber()%></td>
            <td><%=h.getName()%></td>
            <td><span href="editHero.jsp?number=<%=h.getNumber()%>">修改</span><span>删除</span></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <form action="" name="addform">
        排名:<input type="text" name="number" id="number" placeholder="请输入排名" />
        姓名:<input type="text" name="name" id="name" placeholder="请输入姓名"/>
        <button type="submit">添加</button>
    </form>

</div>
</body>
</html>
