<%@ page import="java.io.File" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="org.apache.commons.io.IOUtils" %>
<%@ page import="java.io.FileInputStream" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/31
  Time: 11:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件下载2</title>
</head>
<body>
<%
    //创建文件对象读取文件
    File file=new File("e://石头.PNG");
    //重置输出流,非必须
    response.reset();
    //输出流,通过响应获取
    OutputStream os=response.getOutputStream();
    //设置下载文件名称,并对乱码问题进行处理
    response.setHeader("Content-disposition","filename="+ URLEncoder.encode("中文.zip","utf-8"));
    //写入输出流
    IOUtils.copy(new FileInputStream(file),os);
    //刷新
    os.flush();
    //关闭
    os.close();
%>
</body>
</html>
