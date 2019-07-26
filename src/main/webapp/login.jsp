<%--
  TODO:
  User: 李冠鹏
  Date: 2019/7/25
  Time: 9:01
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>请登录</title>
    <script language="javascript" type="text/javascript">
        function logina(){
            var name=document.getElementById("textName");
            if(name.value==null || name.value==""){
                alert("输入不能为空");
            }else
                document.login.submit();
        }
    </script>
</head>
<body>
<h2 align="center">登陆页面</h2>
<form method="post" name="login" action="./login">
    <p align="center">
        用户名：
        <input type="text" style="border-width: 1px" name="userName" id="textName">
        <input type="button" style="background: royalblue;size: auto" value="登录" onclick="logina()">

    </p>
</form>
</body>
</html>
