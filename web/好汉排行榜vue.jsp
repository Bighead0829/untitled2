<%@ page import="com.westos.web01.bean.Hero" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/30
  Time: 10:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>好汉排行榜vue</title>
    <script type="text/javascript" src="js/axios.min.js"></script>
    <script type="text/javascript" src="js/vue.js"></script>
    <style>
        tr{
            width:100px;
            height:50px;
            text-align:center;
        }
    </style>
</head>

<body>

<div id="heroTable">
    <table  border="1px" cellpadding="0" cellspacing="0" width="600px" height="150px">
        <tr>
            <th>排名</th>
            <th>姓名</th>
            <th>操作</th>
        </tr>
            <tr v-for="(value,key) in heros">
                <td>{{key}}</td>
                <td>{{value}}</td>
                <td><span>修改</span><span>删除</span></td>
            </tr>
    </table>
    <form method="post" name="heroform">
          排名:<input type="text" name="number" v-model="number" id="number" placeholder="请输入排名" />
          姓名:<input type="text" name="name" v-model="name" id="name" placeholder="请输入姓名"/>
          <button type="submit" v-on:click="addHero()">添加</button>
          <%--//<button type="submit">修改</button>--%>
    </form>
</div>
</body>
<script type="text/javascript">
    var vue=new Vue({
        el:'#heroTable',
        data:{
            number:1,
            name:'',
            inited:true,
            heros:{}
        },
        methods:{
            addHero:function(){
                //创建data数组,用来打包传送数据
               /* var data={};
                data.number=this.number;
                data.name=this.name;*/
                var url='addHero.jsp?number='+this.number+'&name='+this.name;
                //传值,并获得一个返回对象,回调函数
                axios.get(url).then(function(result){
                    console.log(result);
                    if(vue.inited){
                        vue.heros=result.data.heros;
                        vue.inited=false;
                        return;
                    }else{
                        if(result.data.msg.indexOf('该排名好汉已存在')>=0){
                            alert('添加失败');
                        }else{
                            alert('添加成功');
                             vue.inited=false;
                            vue.heros=result.data.heros;
                        }
                    }
                }).catch(function(err){
                    console.log(err);
                })
            }

        },
        mounted:function(){
            console.log('inited');
            this.addHero();
        }
    });
</script>
</html>
