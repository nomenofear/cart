package servlet;

import bean.Product;
import com.alibaba.fastjson.JSON;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class GetAllProductServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = new ArrayList<Product>();
        Product p1 = new Product();
        p1.setId("5001");
        p1.setPrice(20);
        p1.setProductName("雨伞");
        productList.add(p1);
        Product p2 = new Product();
        p2.setId("5002");
        p2.setPrice(12);
        p2.setProductName("剪刀");
        productList.add(p2);
        Product p3 = new Product();
        p3.setId("5003");
        p3.setPrice(5);
        p3.setProductName("胶水");
        productList.add(p3);

        ///转化为JSON字符串
        String productJson = JSON.toJSONString(productList);
        response.setCharacterEncoding("utf-8");
        response.getWriter().print(productJson);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
