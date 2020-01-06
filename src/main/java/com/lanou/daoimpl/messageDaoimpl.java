package com.lanou.daoimpl;

import com.lanou.bean.Message;
import com.lanou.bean.Paganation;
import com.lanou.dao.messagedao;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import jdk.net.SocketFlow;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class messageDaoimpl implements messagedao {

    private static DataSource ds = new ComboPooledDataSource();
    public static Connection getConnection() throws Exception {

        return ds.getConnection();
    }


    @Override
    public Paganation<Message> findByPageWithPhysical(Paganation<Message> pageParam) {
        Paganation<Message> page = pageParam;
        String sql = "select*from message where status <=2";
        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection con = null;
        try {
           con = ds.getConnection();
           ps = con.prepareStatement(sql);
           rs = ps.executeQuery();
            List<Message> datas = new ArrayList<Message>();

            while (rs.next()){
                Message message = new Message();
                message.setId(rs.getInt("id"));
                message.setSubject(rs.getString("subject"));
                message.setStatus(rs.getInt("status"));
                message.setCreatetime(rs.getTimestamp("createtime"));
                datas.add(message);
            }
            page.setData(datas);
            ps= con.prepareStatement("select count(*) from message");
            rs = ps.executeQuery();
            int totalCount = 0;
            if(rs.next()) {
                totalCount  = rs.getInt(1);
            }
            page.setTotalCount(totalCount);
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return page;
    }
}
