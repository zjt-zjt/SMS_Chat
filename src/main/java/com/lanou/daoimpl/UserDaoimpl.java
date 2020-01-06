package com.lanou.daoimpl;

import com.lanou.bean.User;
import com.lanou.dao.UserDao;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import javax.servlet.jsp.tagext.TryCatchFinally;
import java.sql.SQLException;

public class UserDaoimpl implements UserDao {
    public static final QueryRunner qr = new QueryRunner(new ComboPooledDataSource());

    @Override
    public User findUserByUsername(String account) {
        User user = null;
      String sql = "select *from user where account = ?";

    try{
        user = qr.query(sql,new BeanHandler<>(User.class),account);
    } catch (SQLException e) {
        e.printStackTrace();
    }

        return user;
    }

    @Override
    public int updateUser(User user) {
        return 0;
    }
}
