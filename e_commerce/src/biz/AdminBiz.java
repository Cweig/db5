package biz;

import java.sql.SQLException;

public interface AdminBiz {
    public boolean adminLogin(String admin,String password) throws SQLException;
}
