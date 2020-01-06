package com.lanou.web;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.lanou.bean.Message;
import com.lanou.bean.Paganation;
import com.lanou.bean.ResponseInfo;
import com.lanou.bean.User;
import com.lanou.dao.UserDao;
import com.lanou.dao.messagedao;
import com.lanou.daoimpl.UserDaoimpl;
import com.lanou.daoimpl.messageDaoimpl;
import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import sun.net.httpserver.HttpsServerImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.sql.DataSource;
import java.io.IOException;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/SMS.login.jsp")
public class loginServlet extends HttpServlet {
    private static DataSource ds = new ComboPooledDataSource();
    public static Connection getConnection() throws Exception {

        return ds.getConnection();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


        resp.setContentType("text/html;charset= UTF-8");
        String account = req.getParameter("account");
        String password = req.getParameter("password");
        String remember = req.getParameter("remember");
        HttpSession session = req.getSession();
        session.setAttribute("account",account);
        String sql = "select *from user ";
        String sql1 = "update user set last_login_time = ? where account = ?";
        ResponseInfo res = new ResponseInfo();
         User user = new User();
        PreparedStatement ps = null;
        PreparedStatement ps1 = null;
        ResultSet rs = null;
        try  {
            Connection con = ds.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            ps1 = con.prepareStatement(sql1);

            if(remember != null && "on".equals(remember)) {
                account = URLEncoder.encode(account, "UTF-8");
                password = URLEncoder.encode(password, "UTF-8");
                Cookie userCookie = new Cookie("account", account);
                Cookie pwdCookie = new Cookie("password", password);

                resp.addCookie(userCookie);
                resp.addCookie(pwdCookie);
            }else{
                Cookie userCookie = new Cookie("account", null);
                Cookie pwdCookie = new Cookie("password", null);
                userCookie.setMaxAge(0);
                pwdCookie.setMaxAge(0);

                resp.addCookie(userCookie);
                resp.addCookie(pwdCookie);
            }

                while (rs.next()){
                    if(rs.getString("account").equals(account)&&rs.getString("password").equals(password)){
                        req.getRequestDispatcher("SMS.first.jsp").forward(req,resp);

                        Date date = new Date();
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        String  last_login_time = sdf.format(date);
                        ps1.setString(1, last_login_time);
                        ps1.setString(2, account);
                        ps1.executeUpdate();


                    }

                }
       //req.getRequestDispatcher("SMS.register.jsp").forward(req,resp);

         } catch (SQLException e) {
            e.printStackTrace();
         }


        String action = req.getParameter("action");
        switch (action){
            case "exit":
                doexit(req,resp);
                break;
            case "inbox":
                doinbox(req,resp);
                break;
            default:
                break;
        }


    }

    private void doinbox(HttpServletRequest req, HttpServletResponse resp) throws IOException {
       messagedao ms = new messageDaoimpl();
        Paganation<Message> paganation = new Paganation<Message>();
        paganation =  ms.findByPageWithPhysical(paganation);
        Map<String,Object> data = new HashMap<>();
        data.put("code",0);
        data.put("msg","");
        data.put("count",paganation.getTotalCount());
        data.put("data",paganation.getData());
       String st = JSON.toJSONString(data);
       resp.getWriter().println(st);
       return ;
    }


    private void doexit(HttpServletRequest req, HttpServletResponse resp) throws IOException {
      // String account =  req.getParameter("account");
        resp.sendRedirect("SMS.Login.jsp");
        //HttpSession session = req.getSession();
       // session.removeAttribute(account);

    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       req.setCharacterEncoding("UTF-8");
        doGet(req,resp);
    }
}
