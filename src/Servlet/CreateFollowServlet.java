package Servlet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import Pool.ConnectionPool;
import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

/**
 * Created by duchenguang on 2017/1/12.
 */
public class CreateFollowServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String maker = request.getParameter("maker");
        String PID = request.getParameter("PID");
        String textbox = request.getParameter("textbox");
        String AID = request.getParameter("AID");

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
        } catch (SmartUploadException e) {
            e.printStackTrace();
        }
        if(isUpImage==1){
            textbox+="<br><img src=\\'img/"+filename+"\\'>";
        }

        String sql = "INSERT INTO Follow"+AID+"(FContent,FollowTo,FMaker) VALUES('"+textbox+"',"+PID+",'"+maker+"')";
        try {
            Connection conn = ConnectionPool.getConnection();
            Statement st = conn.createStatement();
            st.execute(sql);
            ConnectionPool.returnConnection(conn);
            st.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.sendRedirect("HomePage");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
