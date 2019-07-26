package servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

public class RemoveFromCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();
        RequestDispatcher dispatcher;

        //遍历map  在cart中删除对应pName的数据 并重新保存到session.
        String pName = request.getParameter("pName");
        Map cart = (Map) session.getAttribute("cart");
        Iterator<String> iter = cart.keySet().iterator();
        while (iter.hasNext()) {
            String name = iter.next();
            if (name.equals(pName)) {
                iter.remove();
                break;
            }
        }
        session.setAttribute("cart", cart);
}
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
