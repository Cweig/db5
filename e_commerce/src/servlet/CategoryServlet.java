package servlet;

import bean.DBBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class CategoryServlet extends HttpServlet{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse rep) throws ServletException, IOException {
        // TODO 在返回时提示信息没有出现，需要修复

        System.out.println("Servlet");

        String cid=req.getParameter("cid");
        String name=req.getParameter("name");
        System.out.println(cid+"  "+name);
        try{

            DBBean dbBean=new DBBean();
            String sql="update category set name='"+name+"' where cid='"+cid+"'";
            dbBean.executeUpdate(sql);
            req.setCharacterEncoding("UTF-8");
            PrintWriter out=rep.getWriter();
            req.setAttribute("cid", cid);
            req.getRequestDispatcher("category_modify.jsp?cid="+cid).forward(req, rep);
            out.print("<script language='javaScript'> alert('更新完毕');</script>");
        }
        catch (Exception ex){
            ex.printStackTrace();
            req.setAttribute("cid", cid);
            req.getRequestDispatcher("category_modify.jsp?cid="+cid).forward(req, rep);

            req.setCharacterEncoding("UTF-8");
            PrintWriter out=rep.getWriter();
            out.print("<script language='javaScript'> alert('更新失败，检查错误并请稍后重试');</script>");
        }
    }
}