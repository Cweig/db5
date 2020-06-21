package dao;

import java.sql.SQLException;

public interface AdminDao {
    public boolean adminLogin(String admin,String password) throws SQLException;
}

