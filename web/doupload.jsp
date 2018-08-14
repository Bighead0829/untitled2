<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory" %>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.FileOutputStream" %>
<%@ page import="org.apache.commons.io.IOUtils" %>
<%@ page import="org.apache.commons.fileupload.FileItem" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/29
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>doupload</title>
</head>
<body>
<%
    //设置上传文件操作工厂
    DiskFileItemFactory dfif=new DiskFileItemFactory();
    //设置工厂缓冲区大小80kb
    dfif.setSizeThreshold(80*1024);
    //设置上传文件组件
    ServletFileUpload sfu=new ServletFileUpload(dfif);
    //设置上传文件大小
    //单文件40MB
    sfu.setFileSizeMax(40*1024*1024);
    //总文件setSizeMax()
    //请求解析数据
    List<FileItem> items=sfu.parseRequest(request);
    //遍历输出
    for(FileItem item:items){
        //判断是否为普通输入框
        if(item.isFormField()){
            //若为普通输入框
            System.out.println(item.getFieldName());
            System.out.println(item.getString());
        }else{
            //文件上传
            System.out.println("获取文件的值:");
            System.out.println(item.getFieldName());
            System.out.println(item.getName());
            //将上传的文件保存在pageContext中
            pageContext.setAttribute("filename",item.getName());
            //建立黑名单
            if(item.getName().equals("Date.jsp")) {
                response.getWriter().println("您上传的文件非法,上传失败");
            }//else if(item.getName().endsWith(".PNG")){
            // response.getWriter().println("您上传的文件符合要求,上传成功");
            // }else{
            //response.getWriter().println("上传成功");
            //}
            //创建白名单
            //TODO保证上传文件名称的一致性
            //获取输入流并保存到文件
            //获取项目的真实路径
            String realpath=request.getServletContext().getRealPath("/");
            //String realpath=request.getServletPath();
            String filename=realpath+ File.separator+item.getName();
            OutputStream os=new FileOutputStream(new File(filename));
            IOUtils.copy(item.getInputStream(),os);
        }
    }
%>
<img src="<c:out value="${filename}"/>"/>

</body>
</html>
