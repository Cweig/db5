package servlet;

import bean.DBBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

public class VersionServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse rep) throws ServletException, IOException {
        System.out.println("Servlet");

        // TODO 显示中文出现乱码

        String vid = req.getParameter("vid");
        String gid=req.getParameter("gid");
        String price=req.getParameter("price");
        String stock=req.getParameter("stock");
        String mid=req.getParameter("mid");
        String color=req.getParameter("color");
        String weight=req.getParameter("weight");
        String other1=req.getParameter("other1");
        String other2=req.getParameter("other2");
        String other3=req.getParameter("other3");
        String photo_path=req.getParameter("photo_path");
        System.out.println(vid+" "+gid+" "+" "+price+" "+stock+" "+mid+" "+color+" "+weight+" "+other1+" "+other2+" "+other3+" "+photo_path);
        try {
            DBBean dbBean = new DBBean();
            String sql = "update version set price='"+price+"',stock='"+stock+"',mid='"+mid+"',color='"+color+"',weight='"+weight+"',other1='"+other1+"',other2='"+other2+"',other3='"+other3+"' where vid='"+vid+"' and gid='"+gid+"'";

            dbBean.executeUpdate(sql);
            req.setCharacterEncoding("UTF-8");
            PrintWriter out = rep.getWriter();
            req.getRequestDispatcher("version_modify.jsp?vid=" + vid+"&gid="+gid+"&vid="+vid).forward(req, rep);
            out.print("<script language='javaScript'> alert('更新完毕');</script>");

            dbBean.close();
        } catch (Exception ex) {
            ex.printStackTrace();
            req.getRequestDispatcher("version_modify.jsp?vid=" + vid+"&gid="+gid+"&vid="+vid).forward(req, rep);

            req.setCharacterEncoding("UTF-8");
            PrintWriter out = rep.getWriter();
            out.print("<script language='javaScript'> alert('更新失败，检查错误并请稍后重试');</script>");
        }
    }
}
