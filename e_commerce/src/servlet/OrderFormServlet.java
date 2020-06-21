package servlet;

import bean.DBBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;

@WebServlet("/OderFormServlet")

public class OrderFormServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void service(HttpServletRequest req, HttpServletResponse rep) throws ServletException, IOException {
        // TODO �ڷ���ʱ��ʾ��Ϣû�г��֣���Ҫ�޸�
        // TODO ��չʾ�ʹ洢datetimeʱ�������ݾ��ȶ�ʧ����->��String date �ĳ�Timestamp date

        System.out.println("Servlet");

        req.setCharacterEncoding("UTF-8");
        String oid = req.getParameter("oid");
        String uid = req.getParameter("uid");
        String total=req.getParameter("total");
        String shopping_address=req.getParameter("shopping_address");
        String date=req.getParameter("date");
        String cellphone=req.getParameter("cellphone");
        System.out.println(oid + "  " + uid+" "+total+" "+shopping_address+" "+date+" "+cellphone);

        try {
            DBBean dbBean = new DBBean();
            String sql = "update order_form set uid='"+uid+"',total='"+total+"',shopping_address='"+shopping_address+"',date='"+date+"',cellphone='"+cellphone+"'where oid='"+oid+"'";
            dbBean.executeUpdate(sql);
            req.setCharacterEncoding("UTF-8");
            PrintWriter out = rep.getWriter();
            req.setAttribute("oid", oid);
            req.getRequestDispatcher("order_form_modify.jsp?oid=" + oid).forward(req, rep);
            out.print("<script language='javaScript'> alert('�������');</script>");

            dbBean.close();
        } catch (Exception ex) {
            ex.printStackTrace();
            req.setAttribute("oid", oid);
            req.getRequestDispatcher("order_form_modify.jsp?oid=" + oid).forward(req, rep);

            req.setCharacterEncoding("UTF-8");
            PrintWriter out = rep.getWriter();
            out.print("<script language='javaScript'> alert('����ʧ�ܣ����������Ժ�����');</script>");
        }

    }
}