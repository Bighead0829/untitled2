<%@ page import="com.westos.web01.bean.Hero" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/30
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改排行榜</title>
</head>
<body>
<%
    //获取从客户端提交的数据
    String number=request.getParameter("number");
    String name=request.getParameter("name");
    //获取列表
    List<Hero> list=(List<Hero>)application.getAttribute("hero");
    //检查NPE
    if(list==null){
        list=new ArrayList<Hero>();
    }
    //定义信息提示字符串
    String msg="您要修改的好汉排名不存在";
    //根据排名查找好汉
    for(Hero h:list){
        if(h.getNumber().equals(Integer.valueOf(number))){
            //修改姓名
            h.setName(name);
            //修改提示信息字符串
            msg="好汉信息修改成功";
            //退出循环
            break;
        }
    }
%>
<script type="text/javascript">
    alert(<%=msg%>);
    //执行操作完毕后,从当前页面跳转到好汉排行榜页面
    document.location.herf="好汉排行榜vue.jsp";
</script>
</body>
</html>
