<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/8/1
  Time: 23:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html;charset=UTF-8");
%>
<html>
<head>


    <title>好汉排行榜</title>
    <style type="text/css">
        table {
            border: 1px solid ;

            border-collapse: collapse;
            table-layout: fixed;
            margin-top: 10px;
            width: 100%;
        }
        table td,
        table th {
            height: 30px;
            border: 1px solid ;
            background: #fff;
            font-size: 15px;
            padding: 3px 3px 3px 8px;
        }
    </style>

    <script type="text/javascript" src="js/vue.js"></script>
    <script src="js/axios.min.js"></script>
</head>
<body>
<div id="app" >


            <table>
                <tr>
                    <th>序号</th>
                    <th>姓名</th>
                    <th>绰号</th>
                    <th>操作</th>
                </tr>
                <tr v-for="(value,key) in haohan" >
                    <td>{{key}}</td>
                    <td>{{value[0]}}</td>
                    <td>{{value[1]}}</td>
                    <td><span v-on:click="deletedata(key)">删除</span>
                        <span v-on:click="change(key,value)">修改</span>

                    </td>
                </tr>
            </table>
            <form name="form1" method="post"  >
                <!--通过v-model方法进行获取值和赋值-->
                序号<input type="text" v-model="lid" name="lid"/><br />
                姓名<input type="text" v-model="lname" name="lname"/><br />
                绰号<input type="text" v-model="lchuohao" name="lchuohao"/><br />
                <button type="submit" v-on:click="add()">添加</button>
                <button type="button" v-on:click="xiugai()">修改</button>
            </form>

</div>
</body>
<script type="text/javascript">
    var vue = new Vue({
        el:'#app',
        data:{
            lid:1,
            lname:'宋江',
            lchuohao:'及时雨',

            //这里存储修改的位置

            inited: true ,

            haohan:{}
        },
        methods: {
            //通过push方法往data中haohan数组中继续添加数据
            add: function () {
                //给data打包,传输这次文本框输入的数据
                var data = {}
                data.lid = this.lid;
                data.lname = this.lname;
                data.lchuohao = this.lchuohao;
                var url = 'dohaohan.jsp?id=' + data.lid + '&name=' + data.lname + '&chuohao=' + data.lchuohao;
                //将值传过去,并获得一个返回对象
                axios.get(url).then(function (result) {
                    console.log(result);
                    if (vue.inited) {
                        vue.haohan = result.data.haohan;
                        vue.inited = false;
                        return;
                    }
                    if (result.data.msg.indexOf('用户名已存在') >= 0) {
                        alert("添加失败")
                    }
                    else {
                        alert('添加成功');
                        //vue.inited=false;
                        //重新给其赋值
                        vue.haohan = result.data.haohan;
                    }

                }).catch(function (reason) {
                    console.log(reason);
                })
            },
            //先把数据显示到文本框
            change:function(key,value){
                this.lid = key ;
                this.lname = value[0];
                this.lchuohao = value[1];
                //记录下当前要修改的行数

            },
            //进行传值并进行数据进行修改
            xiugai:function(){
                //不进行数据打包,直接获取数据传值
                var url = 'xiugai.jsp?id='+this.lid+ '&name=' +this.lname+ '&chuohao='+this.lchuohao;
                axios.get(url).then(function (result) {
                    if (result.data.msg.indexOf('修改成功') >= 0) {
                        alert("修改成功");
                        //重新给其赋值
                        vue.haohan = result.data.haohan;
                    }
                    else {
                        alert('修改失败');
                        //vue.inited=false;

                    }
                }).catch(function (reason) {
                    console.log(reason);
                })
            },
            deletedata:function (key) {
                var data2 = {}
                data2.key = key ;
                var url = 'shanchu.jsp';
                axios.post(url,data2).then(function (result) {
                    if (result.data.msg.indexOf('删除成功')>=0){
                        vue.haohan = result.data.haohan;
                        alert("删除成功");
                    }
                    else{
                        alert("删除失败");
                    }
                })


            }
        },

            mounted: function () {
                console.log('init');
                this.add();
            }
        });
</script>
</html>
