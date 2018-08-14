<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/28
  Time: 8:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>regAjax</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript">
        jQuery(function(){
             jQuery("#submitbtn").click(function(){
                  jQuery.get('doReg2.jsp?username='+$("#username").val()+'&password='+$("#password").val(),function(request){
                      console.log(request);
                      if(request.indexOf("用户名已存在")>0){
                          alert("用户名已存在");
                      }else{
                          alert("用户名注册成功");
                      }
                  });
             });
        });
    </script>
</head>
<body>
<form name="form1" method="post" action="doReg2.jsp">
    昵称:<input type="text" name="username" id="username"/>
    密码:<input type="password" name="pwd" id="password"/>
    <button type="submit" id="submitbtn">注册</button>
</form>
</body>
</html>
