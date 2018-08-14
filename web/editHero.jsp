<%@ page import="com.westos.web01.bean.Hero" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/28
  Time: 2:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改排行榜页面</title>
</head>
<body>
<%
    //获取列表
    List<Hero> list=(List<Hero>)application.getAttribute("hero");
    //处理NPE
    if(list==null){
        list=new ArrayList<Hero>();
    }
    //获取接收的参数
    String number=request.getParameter("number");
    //根据排名查找英雄
    for(Hero h:list){
        if(h.getNumber().equals(Integer.valueOf(number))){
            //将查找到的数据进行存储
            pageContext.setAttribute("h",h);
            break;
        }
    }

%>
<form name="editform" method="post" action="./updateHero.jsp">
    排名:<input type="text" name="number" id="number" placeholder="请输入排名" value="<c:out value="${h.number}">"/>
    姓名:<input type="text" name="name" id="name" placeholder="请输入姓名" value="<c:out value="${h.name}">"/>
    <button type="submit">修改</button>
</form>
</body>
</html>
