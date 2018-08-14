<%@ page import="org.apache.commons.lang3.StringUtils" %>
<%@ page import="com.westos.untitle2.CityService.CityService" %>
<%@ page import="com.westos.untitle2.bean.Shengfen" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/24
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JSP02</title>
</head>
<body>


<%
    String sheng=request.getParameter("sheng");
    String city=request.getParameter("city");
    CityService cityService=new CityService();
    List<Shengfen> list = cityService.setShengfen();

%>
<select id="sheng" onchange="dochang()" name="sheng">
    <option value="">请选择省份:</option>
    <%
        Shengfen selectedshengfen=null;
        for(Shengfen sf:list){
            String selected="";
            if(StringUtils.equals(sf.getName(),sheng)){
                selected="selected";
                selectedshengfen=sf;
            }
            response.getWriter().println("<option value='"+sf.getName()+"' "+selected+">"+sf.getName()+"</option>");
        }
    %>
</select>
<%
    if(sheng!=null){
%>
<select id="shi"  name="shi">
    <option value="">请选择城市:</option>
    <%
        for(String cs:selectedshengfen.getCitys()){
            String selected="";
            if(StringUtils.equalsIgnoreCase(city,cs)){
                selected="selected";
            }
            response.getWriter().println("<option value='"+cs+"' "+selected+">"+cs+"</option>");
        }
    %>
</select>
<%
    }
%>
<button type="submit">提交</button>
<%
    if(sheng!=null){
%>
<h3>您选择的是+sheng
    <%
        if(city!=null){

            response.getWriter().println(city);
        }
    %>
</h3>
<script>
    function dochange(){
        form1.submit();
    }
</script>
</body>
</html>
