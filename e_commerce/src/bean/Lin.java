package bean;
import java.sql.*;

public class Lin {
    public String driverName;
    public String userName;
    private String userPasswd;
    public String dbName;
    public String url;
    private Statement stmt=null;
    private Connection conn=null;

/*    public Lin(){
        this.driverName="";
        this.userName="";
        this.userPasswd="";
        this.dbName="";
        this.url="";
        this.stmt=null;
    }*/
    public Lin(){
        this.driverName = "com.mysql.cj.jdbc.Driver";
        this.userName = "eins";
        this.userPasswd = "F0rg@vEM3";
        this.dbName = "e_commerce";
        this.url = "jdbc:mysql://47.113.122.126/" + this.dbName + "?user=" + this.userName + "&password=" + this.userPasswd;
        try{
        Class.forName(this.driverName);
        
        this.conn = DriverManager.getConnection(this.url);
        this.stmt = this.conn.createStatement();
        }catch (Exception e){
            e.printStackTrace();
        };
       /* return null;*/
    };
    public void close() {
        try {
            stmt.close();
            conn.close();
            System.out.println("close connection");
        } catch (Exception e) {
        }
    }
    public Statement getStmt(){
        return this.stmt;
    }
    public Connection getConn(){
      return this.conn;
    };
    public ResultSet getRS(String name){
        ResultSet rs=null;
        try {
            rs = this.stmt.executeQuery(name);
        }catch (SQLException e){
            e.printStackTrace();
            return rs;
        }
        return rs;
    };
    public void execute(String name){
        try{
            this.stmt.executeUpdate(name);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return;
    }




}
