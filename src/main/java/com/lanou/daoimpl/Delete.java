package com.lanou.daoimpl;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Delete {

    private static DataSource ds = new ComboPooledDataSource();
    public static Connection getConnection() throws Exception {

        return ds.getConnection();
    }
    public  static int deletemessage(String id) {
        int count = 0;
        Connection con = null;
        PreparedStatement ps = null;
        String sql = "update message set status =3 where id = ?";
        try {
            con = ds.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1, id);
            count = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

}
