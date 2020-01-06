package com.lanou.dao;

import com.lanou.bean.User;

public interface UserDao {
     User findUserByUsername(String account);

    int updateUser(User user);

}
