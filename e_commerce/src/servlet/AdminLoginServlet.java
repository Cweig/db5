package servlet;

import biz.AdminBiz;
import biz.impl.AdminBizImpl;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

public class AdminLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String aid=request.getParameter("aid");
        String password=request.getParameter("password");

        AdminBiz adminBiz=new AdminBizImpl();
        boolean result= false;
        try {
            result = adminBiz.adminLogin(aid, password);
        } catch (SQLException sqlException) {
            sqlException.printStackTrace();
        }
        response.setContentType("text/html;charset=UTF-8");
        if(result) {
            HttpSession session=request.getSession();
            session.setAttribute("logined", "logd");
            response.sendRedirect("manage_perform.jsp");
        }
        else {
            PrintWriter out=response.getWriter();
            out.print("<script language='javaScript'> alert('’À∫≈ªÚ√‹¬Î¥ÌŒÛ');</script>");
        }
    }
}
