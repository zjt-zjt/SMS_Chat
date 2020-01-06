package com.lanou.web;

import com.alibaba.fastjson.JSON;
import com.lanou.bean.Message;
import com.lanou.bean.User;
import com.lanou.daoimpl.Delete;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.mchange.v2.sql.filter.SynchronizedFilterDataSource;
import com.sun.xml.internal.bind.v2.model.core.ID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/operationServlet")
public class operationServlet extends HttpServlet {

    private static DataSource ds = new ComboPooledDataSource();
    public static Connection getConnection() throws Exception {

        return ds.getConnection();
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        switch (action){
            case "look":
                dolook(req,resp);
                break;
            case "delete":
                dodelete(req,resp);
                break;
            case "write":
                dowrite(req,resp);
                break;
        }

    }

    private void dowrite(HttpServletRequest req, HttpServletResponse resp) {
        String sql = "select account from user";
         Connection con =null;
         PreparedStatement ps = null;
         ResultSet rs = null;
         try{
             con = ds.getConnection();
             ps = con.prepareStatement(sql);
             rs = ps.executeQuery();

            while (rs.next()){
                String account =   rs.getString("account");
//              Map<String,Object> data = new HashMap<>();
//               data.put("data",account);
//                String st = JSON.toJSONString(data);
//               System.out.println(st);
//               resp.getWriter().println(st);
//               return;

             }

         } catch (SQLException e) {
             e.printStackTrace();
         }



    }



    private void dodelete(HttpServletRequest req, HttpServletResponse resp) throws IOException {
       String id = req.getParameter("id");
       int counts = Delete.deletemessage(id);
       String count = "{\rs\":"+counts+"}";
         resp.getWriter().println(count);
    }

    private void dolook(HttpServletRequest req, HttpServletResponse resp) {
        String id = req.getParameter("ID");
        String sql = "select from_id ,subject,content,status,attachment from message where id=? ";
        String sql1 = "update message set status = 2 where id = ?";
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            con = ds.getConnection();
            ps = con.prepareStatement(sql);
            ps.setString(1,id);
            rs = ps.executeQuery();
             ps = con.prepareStatement(sql1);
            ps.setString(1,id);
             ps.executeUpdate();



            while (rs.next()){
             int from_id =   rs.getInt("from_id");
             String subject = rs.getString("subject");
             String content = rs.getString("content");
               int status = rs.getInt("status");
             String attachment = rs.getString("attachment");
                HttpSession session = req.getSession();
                session.setAttribute("from_id",from_id);
                session.setAttribute("subject",subject);
                session.setAttribute("content",content);
                session.setAttribute("attachment",attachment);
               req.getRequestDispatcher("SMS.three.jsp").forward(req,resp);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }




    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
