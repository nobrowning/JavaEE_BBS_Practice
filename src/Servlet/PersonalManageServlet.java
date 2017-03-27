package Servlet;

import Beans.Post;
import Pool.ConnectionPool;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;

/**
 * Created by duchenguang on 2017/1/13.
 */

public class PersonalManageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if(session.getAttribute("userName")==null){
            response.sendRedirect("HomePage");
        }else{
            String name = session.getAttribute("userName").toString();
            Connection conn = null;
            PreparedStatement pst = null;
            Collection<Post> posts = new ArrayList<Post>();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            try {
                conn = ConnectionPool.getConnection();
                String sql = "SELECT * From Post1 WHERE PMaker='"+name+"'";
                pst = conn.prepareStatement(sql);
                ResultSet rst = pst.executeQuery();
                while(rst.next()){
                    Post p = new Post();
                    p.setAID("1");
                    p.setTitle(rst.getString("PTitle"));
                    p.setCreateTime(format.format(rst.getTimestamp("PCreateTime")));
                    p.setLastTime(rst.getString("PLastTime"));
                    p.setLastUSer(rst.getString("PLastUser"));
                    p.setID(rst.getString("PID"));
                    posts.add(p);
                }
                rst = pst.executeQuery("SELECT * From Post2 WHERE PMaker='"+name+"'");
                while(rst.next()){
                    Post p = new Post();
                    p.setAID("2");
                    p.setTitle(rst.getString("PTitle"));
                    p.setCreateTime(format.format(rst.getTimestamp("PCreateTime")));
                    p.setLastTime(rst.getString("PLastTime"));
                    p.setLastUSer(rst.getString("PLastUser"));
                    p.setID(rst.getString("PID"));
                    posts.add(p);
                }
                rst = pst.executeQuery("SELECT * From Post3 WHERE PMaker='"+name+"'");
                while(rst.next()){
                    Post p = new Post();
                    p.setAID("3");
                    p.setTitle(rst.getString("PTitle"));
                    p.setCreateTime(format.format(rst.getTimestamp("PCreateTime")));
                    p.setLastTime(rst.getString("PLastTime"));
                    p.setLastUSer(rst.getString("PLastUser"));
                    p.setID(rst.getString("PID"));
                    posts.add(p);
                }
                pst.close();
                ConnectionPool.returnConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            request.setAttribute("posts",posts);
            RequestDispatcher dispatcher = request.getRequestDispatcher("PersonalManager.jsp");
            dispatcher.forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
