package servlet;

import bean.DBBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class UserServlet extends HttpServlet{
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse rep) throws ServletException, IOException {
        // TODO �ڷ���ʱ��ʾ��Ϣû�г��֣���Ҫ�޸�

        System.out.println("Servlet");

        String uid=req.getParameter("uid");
        String name=req.getParameter("name");
        String password=req.getParameter("password");
        String gender=req.getParameter("gender");
        String cellphone=req.getParameter("cellphone");
        String address=req.getParameter("address");
        System.out.println(uid+"  "+password+"  "+name+"  "+gender+"  "+cellphone+"  "+address);

        try{

            if(!(gender.equals("male")||gender.equals("female"))){
                req.setCharacterEncoding("UTF-8");
                PrintWriter out=rep.getWriter();
                out.print("<script language='javaScript'> alert('�Ա���д����');</script>");
            }

            DBBean dbBean=new DBBean();
            String sql="update user set name='"+name+"',password='"+password+"',gender='"+gender+"',cellphone='"+cellphone+"',address='"+address+"' where uid="+uid;
            dbBean.executeUpdate(sql);
            req.setCharacterEncoding("UTF-8");
            PrintWriter out=rep.getWriter();
            req.setAttribute("uid", uid);
            req.getRequestDispatcher("user_modify.jsp?uid="+uid).forward(req, rep);
            out.print("<script language='javaScript'> alert('�������');</script>");
        }
        catch (Exception ex){
            ex.printStackTrace();
            req.setAttribute("uid", uid);
            req.getRequestDispatcher("user_modify.jsp?uid="+uid).forward(req, rep);

            req.setCharacterEncoding("UTF-8");
            PrintWriter out=rep.getWriter();
            out.print("<script language='javaScript'> alert('����ʧ�ܣ����������Ժ�����');</script>");
        }
    }
}
