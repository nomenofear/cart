<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <script>
        function getProducts(){
            //获取商品列表函数
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
                    showData(str1);
                }
            }
            xmlhttp.open("POST","./getAllProduct",true);
            xmlhttp.send();
        }
        function showData(jstr) {
            //展示商品列表函数
            var o=JSON.parse(jstr);
            var table = document.getElementById("productTable");
            for(var i in o) {
                var r = table.insertRow(table.rows.length);
                var c1 = r.insertCell();
                c1.innerHTML = o[i].id;
                var c2 = r.insertCell();
                c2.innerHTML = o[i].productName;
                var c3 = r.insertCell();
                c3.innerHTML = o[i].price;
            }
        }
        function addToCart(str){
            if(str==null || str==""){
                alert("商品名称不能为空");
            }else
                document.pForm.submit();
        }
        function logout(){
            location.href="./logoutServlet";
        }
    </script>
</head>
<body onload="getProducts()">
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
        <h2>购物页面</h2>
        <form name="pForm" method="post" action="./addToCart">
            输入商品名称：<input type="text" id="pName" name="prodName">
            <input type="button" style="background: royalblue" value="添加到购物车" onclick="addToCart(document.getElementById('pName').value)">
        </form>

        <br><br>

        <table style="border-collapse:collapse;" border="2" id="productTable">
            <tr>
                <td>
                    商品ID
                </td>
                <td>
                    商品名称
                </td>
                <td>
                    价格
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
