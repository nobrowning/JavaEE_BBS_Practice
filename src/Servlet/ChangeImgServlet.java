package Servlet;

import Pool.ConnectionPool;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by duchenguang on 2017/1/13.
 */
public class ChangeImgServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getSession().getAttribute("userName").toString();
        String filename = null;
        String filePath = getServletContext().getRealPath("/")+"img";
        File file = new File(filePath);
        if(!file.exists())
            file.mkdir();
        SmartUpload smartUpload = new SmartUpload();
        smartUpload.initialize(getServletConfig(),request,response);
        smartUpload.setMaxFileSize(1024*1024*10);
        try {
            smartUpload.upload();
            filename = smartUpload.getFiles().getFile(0).getFilePathName();
            smartUpload.save(filePath);
            System.out.println(filename);
        } catch (SmartUploadException e) {
            e.printStackTrace();
        }

        String sql = "UPDATE User SET UImg='img/"+filename+"' WHERE UID='"+name+"'";
        request.getSession().setAttribute("Img","img/"+filename);
        System.out.println(sql);
        try {
            Connection conn = ConnectionPool.getConnection();
            Statement st = conn.createStatement();
            st.execute(sql);
            ConnectionPool.returnConnection(conn);
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("/PersonalManager");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
