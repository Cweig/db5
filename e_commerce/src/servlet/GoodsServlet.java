package servlet;

import bean.DBBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class GoodsServlet extends HttpServlet{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse rep) throws ServletException, IOException {
        // TODO �ڷ���ʱ��ʾ��Ϣû�г��֣���Ҫ�޸�

        System.out.println("Servlet");

        String gid=req.getParameter("gid");
        String name=req.getParameter("name");
        String cid=req.getParameter("cid");
        String description=req.getParameter("description");

        System.out.println(gid+" "+name+" "+cid+" "+description);
        try{

            DBBean dbBean=new DBBean();
            String sql="update goods set name='"+name+"',cid='"+cid+"',description='"+description+"' where gid='"+gid+"'";
            dbBean.executeUpdate(sql);
            req.setCharacterEncoding("UTF-8");
            PrintWriter out=rep.getWriter();
            req.setAttribute("gid", gid);
            req.getRequestDispatcher("goods_modify.jsp?gid="+gid).forward(req, rep);
            out.print("<script language='javaScript'> alert('�������');</script>");
        }
        catch (Exception ex){
            ex.printStackTrace();
            req.setAttribute("gid", gid);
            req.getRequestDispatcher("goods_modify.jsp?gid="+gid).forward(req, rep);

            req.setCharacterEncoding("UTF-8");
            PrintWriter out=rep.getWriter();
            out.print("<script language='javaScript'> alert('����ʧ�ܣ����������Ժ�����');</script>");
        }

    }
}