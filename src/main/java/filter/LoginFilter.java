package filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest)req ;
        HttpServletResponse httpServletResponse = (HttpServletResponse) resp;
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        HttpSession session =  httpServletRequest.getSession();
        String path = httpServletRequest.getServletPath();
        System.out.println("enter filter:" + path);
        if("/login.jsp".equals(path) ){
            chain.doFilter(req, resp);//放行
            return;
        }
        else if(session.getAttribute("userName") == null || session.getAttribute("userName") == "") {
            httpServletRequest.getRequestDispatcher("./login.jsp").forward(httpServletRequest,httpServletResponse);
        }
        //已登录，放行
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
