package servlet;

import bean.DBBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class ShoppingRecordServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse rep) throws ServletException, IOException {
        // TODO �ڷ���ʱ��ʾ��Ϣû�г��֣���Ҫ�޸�
        // TODO ��չʾ�ʹ洢datetimeʱ�������ݾ��ȶ�ʧ����

        System.out.println("Servlet");

        String oid = req.getParameter("oid");
        String gid=req.getParameter("gid");
        String vid=req.getParameter("vid");
        String qty=req.getParameter("QTY");
        System.out.println(oid+" "+gid+" "+vid+" "+qty);

        try {
            DBBean dbBean = new DBBean();
            String sql = "update shopping_record set QTY='"+qty+"' where oid='"+oid+"' and gid='"+gid+"' and vid='"+vid+"'";
            dbBean.executeUpdate(sql);
            req.setCharacterEncoding("UTF-8");
            PrintWriter out = rep.getWriter();
            req.getRequestDispatcher("shopping_record_modify.jsp?oid=" + oid+"&gid="+gid+"&vid="+vid).forward(req, rep);
            out.print("<script language='javaScript'> alert('�������');</script>");

            dbBean.close();
        } catch (Exception ex) {
            ex.printStackTrace();
            req.getRequestDispatcher("shopping_record_modify.jsp?oid=" + oid+"&gid="+gid+"&vid="+vid).forward(req, rep);

            req.setCharacterEncoding("UTF-8");
            PrintWriter out = rep.getWriter();
            out.print("<script language='javaScript'> alert('����ʧ�ܣ����������Ժ�����');</script>");
        }

    }
}