package servlet;

import bean.CartItem;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher;

        //  从session中取出购物车（"cart"）
        Map cart = (Map) session.getAttribute("cart");
        String pName = request.getParameter("prodName");

        // 如果购物车不存在，创建购物车
        if (cart == null) {
            cart = new HashMap();

            // 将购物车存入session之中
            session.setAttribute("cart", cart);
        }

        //  从购物车对象（“cart”）中根据图书书号取出相应的图书项对象
        CartItem cartItem = (CartItem) cart.get(pName);
        if (cartItem != null) // 如果购物车中已有图书项对象，则更新其选购数量.
            cartItem.setQuantity(cartItem.getQuantity() + 1);
        else{		// 否则，创建一个图书项对象条目到购物车（Map cart）中.
            CartItem cartItem1=new CartItem();
            cartItem1.setProduct(pName);
            cartItem1.setQuantity(1);
            cart.put(pName, cartItem1);
        }
        //成功添加到购物车后，转向viewCart.jsp显示购物车,注意dispatcher和sendRedirect的区别
       // dispatcher = request.getRequestDispatcher("./jstlViewCart.jsp");
       // dispatcher.forward(request, response);
        response.sendRedirect("./jstlViewCart.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
