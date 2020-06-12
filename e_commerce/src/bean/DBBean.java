package bean;
import java.sql.*;
public class DBBean {
    private String driverStr = "com.mysql.cj.jdbc.Driver";
    private String connStr = "jdbc:mysql://47.113.122.126/e_commerce?serverTimezone=Asia/Shanghai&useSSL=false&allowPublicKeyRetrieval=true";
    private String dbusername = "eins";
    private String dbpassword = "F0rg@vEM3";
    private Connection conn = null;
    private Statement stmt = null;

    public DBBean()
    {
        try
        {
            Class.forName(driverStr);
            conn = DriverManager.getConnection(connStr, dbusername, dbpassword);
            stmt = conn.createStatement();
        }
        catch (Exception ex) {
            System.out.println("���ݿ�����ʧ�ܣ�");
        }

    }

    public synchronized int executeUpdate(String s) {
        int result = 0;
        System.out.println("--�������:"+s+"\n");
        try {
            result = stmt.executeUpdate(s);
        } catch (Exception ex) {
            System.out.println("ִ�и��´���");
        }
        return result;
    }

    public synchronized ResultSet executeQuery(String s) {
        ResultSet rs = null;
        System.out.print("--��ѯ���:"+s+"\n");
        try {
            rs = stmt.executeQuery(s);
        } catch (Exception ex) {
            System.out.println("ִ�в�ѯ����");
        }
        return rs;
    }
    public synchronized void execQuery(String s){
        try {
            stmt.executeUpdate(s);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            System.out.println("ִ�в�ѯ����");
        }
    }

    public synchronized int  execInsertUser(String name,String pwd,String gender,String cellphone,String address)throws SQLException
    {
    	ResultSet res = null;
    	try
    	{
    		stmt.execute("insert into user values(null,'"+name+"','"+pwd+"','"+gender+"','"+cellphone+"','"+address+"');");
    		res = stmt.executeQuery("select max(uid) from user;");
    		try{
    		if(res.next())
    			
    			return res.getInt(1);
    		}
    		catch(SQLException ex)
    		{
    			ex.printStackTrace();
    		}
    	}
    	catch(SQLException e)
    	{
    		System.out.println("ִ�в������\n"+e.getMessage());
    		
    	}
    	return 0;
    }
    public void close() {
        try {
            stmt.close();
            conn.close();
        } catch (Exception e) {
        }
    }
}