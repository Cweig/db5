package dao.impl;

import bean.DBBean;
import dao.AdminDao;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AdminDaoImpl implements AdminDao {
    public boolean adminLogin(String admin, String password) throws SQLException {
        DBBean db=new DBBean();
        String sql = "select * from administrator where aid=" + admin +" and password="+password+";";
        ResultSet rs = db.executeQuery(sql);
        return rs.next();
    }
}
