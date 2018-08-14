<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/2
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>regVue</title>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/vue.js"></script>
</head>
<body>
<div id="regvue">
    <ul>
        <li v-for="(value,key) in users">{{key}},{{value}}</li>
    </ul>
    <form action="doreg4.jsp" method="post" name="form1">
        昵称:<input type="text" name="username" id="username" placeholder="请输入昵称" v-model="username"/>
        密码:<input type="password" name="password" id="password" placeholder="请输入密码" v-model="password"/>
        <button type="submit" v-on:click="dosubmit()">注册</button>
    </form>
</div>
<script type="text/javascript">
    var vue=new Vue({
        el:'#regvue',
        date:{
            username:'',
            password:'',
            users:{},
            inited:true
        },
        methods:{
            dosubmit:function(){
                 var data={};
                 data.username=this.username;
                 data.password=this.password;
                 jQuery.post('doreg4.jsp',data,function(result,resp){
                     console.log(result);
                     console.log(resp);
                     if(vue.inited){
                         vue.users=result.users;
                         return;
                     }
                     if(result.msg.indexOf('用户名已存在,注册失败')>=0){
                         alert('注册失败');
                     }else{
                         vue.users=result.users;
                         alert('注册成功');
                     }
                 },jb);
            }
        },
        mounted:function(){
            console.log('init');
            this.dosubmit();
        }
    })
</script>
</body>
</html>
