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
    </script>
    <title>不用jstl</title>
</head>
<body>
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
        <%
            Map<String,CartItem> cart = (Map) session.getAttribute("cart");
          //  pageContext.setAttribute("cart",cart);
            if (cart == null || cart.size() == 0)
                out.println("<p>购物车当前为空.</p>");
            else {
                for (Map.Entry<String, CartItem> entry : cart.entrySet()) {
        %>
            <tr>
                <td><%=entry.getValue().getProduct()%></td>
                <td><%=entry.getValue().getQuantity()%></td>
                <td></td>
            </tr>
        <%
            } }
        %>
        </table>
    </div>
</body>
</html>