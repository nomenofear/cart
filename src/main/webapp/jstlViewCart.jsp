<%@ page import="java.util.Map" %>
<%@ page import="bean.CartItem" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%--
  TODO:
  User: 李冠鹏
  Date: 2019/7/25
  Time: 13:27
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script>
        function logout(){
            location.href="./logoutServlet";
        }
        function del(elementId) {
            var pName=elementId.parentNode.parentNode.children[0].innerHTML;
            var xmlhttp;
            if (window.XMLHttpRequest)
            {
                // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
                xmlhttp=new XMLHttpRequest();
            }
            else
            {
                // IE6, IE5 浏览器执行代码
                xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange=function()
            {
                if (xmlhttp.readyState==4 && xmlhttp.status==200)
                {
                    var str1=xmlhttp.responseText;
                    location.reload();
                }
            }
            xmlhttp.open("POST","./removeFromCart",true);
            //setRequestHeader很重要，用来把字符串类型的参数序列化成Form参数
            xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
            xmlhttp.send("pName="+pName);
        }
    </script>
    <title>使用jstl展示购物车</title>
</head>
<body>
    <%
        Map<String,CartItem> cart = (Map) session.getAttribute("cart");
        pageContext.setAttribute("cart",cart);
    %>
    
    <div style="float:right">
        <p>
            欢迎：
            <font color="#4169e1">
                <%= session.getAttribute("userName")%>
            </font>
            <input type="submit" value="退出" onclick="logout()" >
        </p>
    </div>
    
    <div style="clear:both" align="center">
        <h2>购物车列表页面</h2>
        <br><br>
        
        <table style="border-collapse:collapse;" border="2">
            <thead>
            <tr align="center">
                <th>商品名称</th><th>数量</th><th>操作</th>
            </tr>
            </thead>
            
            <!-- not emty UserList --!>
            <c:if test="${empty cart}">
                <tr>
                    <td colspan="3">
                        <b>购物车为空！</b>
                    </td>
                </tr>
            </c:if>
            <c:if test="${not empty cart}">
                <c:forEach items="${cart}" var="cartItem">
                  <tr>
                      <td><c:out value="${cartItem.value.product}" /></td>
                      <td><c:out value="${cartItem.value.quantity}" /></td>
                      <td><input type="button" value="删除" onclick="del(this)"></td>
                  </tr>
                </c:forEach>
            </c:if>
            
        </table>
    </div>
</body>
</html>