package biz.impl;

import biz.AdminBiz;
import dao.AdminDao;
import dao.impl.AdminDaoImpl;

import java.sql.SQLException;

public class AdminBizImpl implements AdminBiz{
    public boolean adminLogin(String admin, String password) throws SQLException {
        //实例化接口
        AdminDao adminDao = new AdminDaoImpl();
        model.admin admin2=new model.admin();
        admin2.setAid(admin);
        admin2.setPassword(password);
        return adminDao.adminLogin(admin2.getAid(), admin2.getPassword());
    }
}
