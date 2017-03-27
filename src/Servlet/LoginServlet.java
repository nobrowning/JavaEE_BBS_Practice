package Servlet;

import Pool.ConnectionPool;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by duchenguang on 2017/1/12.
 */

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        String Img=null;
        int PostNumber = 0,FollowNumber = 0,LookNumber = 0;
        try {
            Connection conn = ConnectionPool.getConnection();
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM User WHERE UID='"+name+"' AND UPassword='"+pass+"'");
            ResultSet rst = pst.executeQuery();
            if(rst.next()){
                Img = rst.getString("UImg");
                PostNumber = rst.getInt("UPostNumber");
                FollowNumber = rst.getInt("UFollowNumber");
                LookNumber = rst.getInt("ULookNumber");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=utf-8");
        if(Img==null){
            request.setAttribute("result","用户名或密码不正确");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login2.jsp");
            dispatcher.forward(request,response);
        }else{
            HttpSession session = request.getSession();
            session.setAttribute("userName",name);
            session.setAttribute("Img",Img);
            session.setAttribute("PostNumber",PostNumber);
            session.setAttribute("FollowNumber",FollowNumber);
            session.setAttribute("LookNumber",LookNumber);
            response.sendRedirect("HomePage");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
