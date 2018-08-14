<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/31
  Time: 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件上传ajax</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script>
        function ysupload(){
            //构造上传数据formmate
            var data=new FormDate(document.getElementById("form1"));
            //构造ajax对象
            var ajax=new XMLHttpRequest();
            //设置请求参数
            ajax.open("POST","doupload.jsp",true)
            //设置回调函数
            ajax.onload=function(request){
                console.log(request);
                console.log(ajax);
                document.getElementById("resp").innerText=ajax.responseText;
            }
            //发送参数
            ajax.send(data);
        }
        //jQuery方式传递
        function jQueryupload(){
            //构造formmate对象
            var data1=new FormDate(jQuery("#form1")[0]);
            jQuery.ajax({
                type:'POST',
                URL:'doupload.jsp',
                data:'data1',
                processData:false,
                contentType:false,
                success:function(resp){
                    console.log(resp);
                    jQuery("#resp").html(resp);
                }
            })

        }


    </script>
</head>
<body>
<form id="form1" name="form1" method="post" enctype="multipart/form-data" action="doupload.jsp">
    文件上传:<input type="file" name="fileupload" id="fl">
    <button type="submit" onclick="ysupload()">原生方式上传</button>
    <button type="submit" onclick="jQueryupload()">jQuery方式上传</button>
</form>
</body>
</html>
