package com.lanou.web;

import com.alibaba.fastjson.JSONObject;
import com.lanou.bean.ResponseInfo;
import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {

    private static DataSource ds = new ComboPooledDataSource();
    public static Connection getConnection() throws Exception {

        return ds.getConnection();
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html;charset= UTF-8");
        String account = req.getParameter("account");
        String password = req.getParameter("password");
        System.out.println(password);
        String spassword = req.getParameter("spassword");
        String nick_name = req.getParameter("nick_name");
        String email = req.getParameter("email");
        ResponseInfo res = new ResponseInfo();
        String sql1 = "select * from user where nick_name = ?";
        String sql = "INSERT INTO user (account,password,nick_name,email) VALUES(?,?,?,?)";
        PreparedStatement ps = null;
        ResultSet rs = null;

        try{
            Connection con = ds.getConnection();
            ps = con.prepareStatement(sql1);
            ps.setString(1,nick_name);
            rs = ps.executeQuery();
//            ps = con.prepareStatement(sql);
//            ps.setString(1, account);
//            ps.setString(2, password);
//            ps.setString(3, nick_name);
//            ps.setString(4, email);
//            ps.executeUpdate();

            String name = "";
            while (rs.next()){
                name = rs.getString("nick_name");
          }
           if (!name.equalsIgnoreCase("")){
              res.setCode(1);
              res.setMessage("此用户名已存在");
               String resJson = JSONObject.toJSONString(res);
              resp.getWriter().println(resJson);
               return ;
           } else {
              res.setCode(2);
              res.setMessage("");

              ps = con.prepareStatement(sql);
           ps.setString(1, account);
            ps.setString(2, password);
            ps.setString(3, nick_name);
            ps.setString(4, email);
            ps.executeUpdate();
               res.setLocal("SMS.Login.jsp");
              String resJson = JSONObject.toJSONString(res);
               String local = "{\"location\":\"SMS.Login.jsp\"}";
              resp.getWriter().println(resJson);
              return;
            }



        } catch (SQLException e) {

        }

    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        doGet(req,resp);
    }
}
