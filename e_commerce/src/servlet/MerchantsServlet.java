package servlet;

import bean.DBBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class MerchantsServlet extends HttpServlet{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse rep) throws ServletException, IOException {
        // TODO �ڷ���ʱ��ʾ��Ϣû�г��֣���Ҫ�޸�

        System.out.println("Servlet");

        String mid=req.getParameter("mid");
        String city=req.getParameter("city");
        String name=req.getParameter("name");
        String phone=req.getParameter("phone");

        System.out.println(mid+" "+name+" "+city+" "+phone);
        try{
            DBBean dbBean=new DBBean();
            String sql="update merchants set name='"+name+"',city='"+city+"',phone='"+phone+"' where mid='"+mid+"'";
            dbBean.executeUpdate(sql);
            req.setCharacterEncoding("UTF-8");
            PrintWriter out=rep.getWriter();
            req.setAttribute("mid", mid);
            req.getRequestDispatcher("merchants_modify.jsp?mid="+mid).forward(req, rep);
            out.print("<script language='javaScript'> alert('�������');</script>");
        }
        catch (Exception ex){
            ex.printStackTrace();
            req.setAttribute("mid", mid);
            req.getRequestDispatcher("merchants_modify.jsp?mid="+mid).forward(req, rep);

            req.setCharacterEncoding("UTF-8");
            PrintWriter out=rep.getWriter();
            out.print("<script language='javaScript'> alert('����ʧ�ܣ����������Ժ�����');</script>");
        }

    }
}