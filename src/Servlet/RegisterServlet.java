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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by duchenguang on 2017/1/12.
 */
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String pass = request.getParameter("pass");
        String email = request.getParameter("email");
        String birthday = request.getParameter("birthday");
        Connection conn = null;
        PreparedStatement pst = null;
        int exist = 0;
        try {
            conn = ConnectionPool.getConnection();
            pst = conn.prepareStatement("SELECT COUNT(*) FROM User WHERE UID='"+name+"'");
            ResultSet rst = pst.executeQuery();
            if(rst.next()){
                exist = rst.getInt(1);
            }
            rst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(exist==0){
            try {
                pst.executeUpdate("INSERT INTO User(UID,UPassword,UEmail,UBirthday) VALUES('"+name+"','"+pass+"','"+email+"','"+birthday+"')");
                String a = "INSERT INTO User(UID,UPassword,UEmail,UBirthday) VALUES('"+name+"','"+pass+"','"+email+"','"+birthday+"')";
                System.out.println(a);
                pst.close();
                ConnectionPool.returnConnection(conn);
                HttpSession session = request.getSession();
                session.setAttribute("userName",name);
                session.setAttribute("Img","img/head.jpg");
                session.setAttribute("PostNumber",0);
                session.setAttribute("FollowNumber",0);
                session.setAttribute("LookNumber",0);
                response.sendRedirect("HomePage");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else{
            request.setAttribute("result","该用户名已被注册");
            RequestDispatcher dispatcher = request.getRequestDispatcher("Register2.jsp");
            dispatcher.forward(request,response);
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
