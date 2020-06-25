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
            System.out.println("数据库连接失败！");
        }

    }

    public synchronized ResultSet executeQuery(String s) {
        ResultSet rs = null;
        System.out.print("--查询语句:"+s+"\n");
        try {
        		rs = stmt.executeQuery(s);
        } catch (Exception ex) {
            System.out.println("执行查询错误！");
        }
        return rs;
    }
    public synchronized void execQuery(String s){
        try {
            stmt.executeUpdate(s);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            System.out.println("执行查询错误！");
        }
    }
    
    public synchronized int executeUpdate(String s) {
        int result = 0;
        System.out.println("--更新语句:"+s+"\n");
        try {
            result = stmt.executeUpdate(s);
        } catch (Exception ex) {
            System.out.println("执行更新错误！");
        }
        return result;
    }
    
	public synchronized void  execUpdateCartGoods(String uid,String gid,String vid,int QTY)
    {
    	ResultSet res=null;
    	try
    	{
    		res=stmt.executeQuery("select qty from shopping_cart where uid="+uid+" and gid="+gid+" and vid="+vid+";");
    		if(res.next())
    		{
    			String basicqty=res.getString("qty").trim();
    			int basic_qty=Integer.parseInt(basicqty);
    			stmt.execute("update shopping_cart set qty="+(basic_qty+QTY)+" where uid="+uid+" and vid="+vid+" and gid="+gid+";");
    		}
    		else if(QTY<0)
    		{
    			return;
    		}
    		else
    			stmt.execute("insert into shopping_cart (uid,gid,vid,qty) values("+uid+","+gid+","+vid+","+QTY+");");
    	}
    	catch(SQLException ex)
    	{
    		System.out.println(ex.getMessage());
    	}
    }
	
	public synchronized void execInsert(String sql) throws SQLException {
        ResultSet rs=null;
        System.out.println("--插入语句:"+sql);
        try{
            stmt.execute(sql);
            System.out.println("插入成功");
        }
        catch (SQLException ex){
            System.out.println("执行插入错误！");
            ex.printStackTrace();
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
    		System.out.println("执行插入错误！\n"+e.getMessage());
    		
    	}
    	return 0;
    }
    
    public synchronized int  execInsertOrder(String uid,String recipient,String total,String address,String cellphone)throws SQLException
    {
    	ResultSet res = null;
    	try
    	{
    		stmt.execute("insert into order_form value(null,'"+uid+"','"+recipient+"','"+total+"','"+address+"',"+"now(),'"+cellphone+"');");
    		res = stmt.executeQuery("select max(oid) from order_form;");
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
    		System.out.println("执行插入错误！\n"+e.getMessage());
    		
    	}
    	return 0;
    }
    
    
    public void close() {
        try {
            stmt.close();
            conn.close();
            System.out.println("close connection");
        } catch (Exception e) {
        }
    }
}