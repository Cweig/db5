package bean;
import java.sql.*;

public class Lin {
    public String driverName;
    public String userName;
    public String userPasswd;
    public String dbName;
    public String url;
    Statement stmt=null;
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
        Class.forName(this.driverName).newInstance();
        Connection conn = DriverManager.getConnection(this.url);
        this.stmt = conn.createStatement();
/*        String sql="select * from covid.ChinaCityInfo";
        ResultSet rs=stmt.executeQuery(sql);
        return rs;*/
        }catch (Exception e){
            e.printStackTrace();
        };
       /* return null;*/
    };

    public Statement getStmt(){
        return this.stmt;
    }
    public ResultSet getRS(String name){
      ResultSet rs=null;


      return rs;
    };


}
