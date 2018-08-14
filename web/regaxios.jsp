<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/29
  Time: 1:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册axios</title>
    <script type="text/javascript" src="js/vue.js"></script>
    <script type="text/javascript" src="js/axios.min.js"></script>
</head>

<body>
<div id="axios">
    <ul>
        <li v-for="(value,key) in users">{{key}},{{value}}</li>
    </ul>
    <form method="post" action="doreg3.jsp" name="form1">
        昵称:<input id="user" name="username" v-model="username" type="text"/>
        密码:<input id="pwd" name="password" v-model="password" type="password"/>
        <button type="submit" id="btn" v-on:click="dosubmit()" >注册</button>
    </form>
</div>

<script type="text/javascript">
    var vue=new Vue({
         el:'#axios',
        data:{
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
                 var url='doreg3.jsp?username='+data.username+'&password='+data.password;
                 axios.get(url).then(function(request){
                      console.log(request);
                      if(vue.inited){
                          vue.users=request.data.users;
                          vue.inited=false;
                          return;
                      }
                      if(request.data.msg.indexOf('用户名已存在')>=0){
                          alert('用户名已存在,注册失败');
                      }else{
                          alert('注册成功');
                          vue.inited=false;
                          vue.users=request.data.users;
                      }
                 }).catch(function(err){
                      //发生错误时调用
                     console.log(err);
                 });
             }
        },
        mounted:function(){
             console.log('init');
             this.dosubmit();
        }
    });
</script>
</body>
</html>
