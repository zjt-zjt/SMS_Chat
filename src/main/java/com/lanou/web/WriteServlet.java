package com.lanou.web;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.sql.DataSource;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
@MultipartConfig
@WebServlet("/WriteServlet")
public class WriteServlet extends HttpServlet {

    private static DataSource ds = new ComboPooledDataSource();
    public static Connection getConnection() throws Exception {

        return ds.getConnection();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset= UTF-8");
        String subject =  req.getParameter("subject");
        String content =  req.getParameter("content");
        // String sql = "select account from user";
        //String sql1 = "insert message (subject ,content) values(?,?) ";
        String sql1 = "insert message (subject,content) values(?,?) ";
        Connection con =null;
        PreparedStatement ps = null;
        // ResultSet rs = null;
        Part part = req.getPart("Myfile");
        String fileName = part.getSubmittedFileName();
        String uploadPath = "/upload";
        String uploadRealPath = getRealPathBaseProject(uploadPath);
        File uploadDir = new File(uploadRealPath);
        if(!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        part.write(uploadRealPath+"/"+fileName);

        resp.getWriter().println("文件上传成功！");


        try{
            con = ds.getConnection();
            // ps = con.prepareStatement(sql);
            ps = con.prepareStatement(sql1);
            ps.setString(1,subject);
            ps.setString(2, content);
            ps.executeUpdate();
            //  rs = ps.executeQuery();

//            while (rs.next()){
//                String account =   rs.getString("account");
//                Map<String,Object> data = new HashMap<>();
//                data.put("data",account);
//                String st = JSON.toJSONString(data);
//                resp.getWriter().println(st);
//             }

        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        doGet(req, resp);
    }


    private String getRealPathBaseProject(String relativePath) {
        return getServletContext().getRealPath(relativePath);
    }

}
