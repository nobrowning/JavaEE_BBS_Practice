package Servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import Pool.ConnectionPool;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

/**
 * Created by duchenguang on 2017/1/11.
 */
public class CreatePostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String textbox = request.getParameter("textbox");
        String AID = request.getParameter("AID");
        String name = request.getParameter("name");
        String makerImg = request.getParameter("makerImg");
        int isUpImage = 0;
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
            isUpImage = smartUpload.save(filePath);
//            "<img src=\"images/"+filename+"\">");
        } catch (SmartUploadException e) {
            e.printStackTrace();
        }
        if(isUpImage==1){
            textbox+="<br><img src=\\'img/"+filename+"\\'>";
        }
        String a = "INSERT INTO Post"+AID+"(PContent,PMaker,PMakerImg,PTitle) VALUES('"+textbox+"','"+name+"','"+makerImg+"','"+title+"')";
        try {
            Connection conn = ConnectionPool.getConnection();
            PreparedStatement pst =  conn.prepareStatement(a);
            pst.executeUpdate();
            ConnectionPool.returnConnection(conn);
            pst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("HomePage");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
