package Servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import Beans.Post;

import java.text.SimpleDateFormat;
import java.util.*;
import java.sql.*;
import java.util.Date;

import Pool.*;

/**
 * Created by duchenguang on 2017/1/10.
 */

public class ShowListServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String AID = request.getParameter("AID");
        String pageNumberStr = request.getParameter("pageNumber");
        int pageNumber=1,currentPage=1;
        ResultSet rst = null;
        if(pageNumberStr==null){
            try {
                Connection conn = ConnectionPool.getConnection();
                PreparedStatement pst =  conn.prepareStatement("SELECT COUNT(*) FROM Post"+AID);
                rst = pst.executeQuery();
                ConnectionPool.returnConnection(conn);
                if(rst.next()){
                    int postNumber = rst.getInt(1);
                    pageNumber = postNumber/10+(postNumber%10==0?0:1);
                }
                rst.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else{
            pageNumber=Integer.parseInt(pageNumberStr);
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
        request.setAttribute("pageNumber",pageNumber);
        request.setAttribute("currentPage",currentPage);
        Collection<Post> Posts = new ArrayList<Post>();
        try {
            Connection conn = ConnectionPool.getConnection();
            PreparedStatement pst =  conn.prepareStatement("SELECT * FROM Post"+AID+" LIMIT "+(currentPage-1)*10+",10");
            rst = pst.executeQuery();
            ConnectionPool.returnConnection(conn);
            Date now = new Date();
            SimpleDateFormat format = new SimpleDateFormat("yyyy,MM,dd,HH,mm,ss");
            String nowTime[] = format.format(now).split(",");
            while(rst.next()){
                Post p = new Post();
                p.setID(rst.getString("PID"));
                p.setTitle(rst.getString("PTitle"));
                p.setContent(rst.getString("PContent"));
                p.setMaker(rst.getString("PMaker"));
                p.setMakerImg(rst.getString("PMakerImg"));
                Timestamp PCreateTime = rst.getTimestamp("PCreateTime");
                if(PCreateTime!=null){
                    p.setCreateTime(HomePageServlet.timeCompare(nowTime,PCreateTime,format));
                }else{
                    p.setCreateTime("——");
                }
                p.setLookNumber(rst.getInt("PLookNumber"));
                p.setReplyNumber(rst.getInt("PReplyNumber"));
                String Lastuser=rst.getString("PLastUser");
                if(Lastuser==null) Lastuser="——";
                p.setLastUSer(Lastuser);
                Timestamp PLastTime = rst.getTimestamp("PLastTime");
                if(PLastTime!=null){
                    p.setLastTime(HomePageServlet.timeCompare(nowTime,PLastTime,format));
                }else{
                    p.setLastTime("——");
                }
                Posts.add(p);
            }
            rst.close();
            pst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("Posts",Posts);
        RequestDispatcher dispatcher = request.getRequestDispatcher("threads.jsp");
        dispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }


}
