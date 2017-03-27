package Servlet;

import Beans.Follow;
import Pool.ConnectionPool;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by duchenguang on 2017/1/12.
 */

public class ShowDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String PID = request.getParameter("PID");
        String AID = request.getParameter("AID");
        String pageNumberStr = request.getParameter("pageNumber");
        int pageNumber=1,currentPage=1;
        Connection conn = null;
        PreparedStatement pst = null;
        try {
            conn  = ConnectionPool.getConnection();
            pst = conn.prepareStatement("UPDATE Post"+AID+" SET PLookNumber = PLookNumber+1 WHERE PID="+PID);
            pst.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(pageNumberStr==null){
            try {

                pst =  conn.prepareStatement("SELECT COUNT(*) FROM Follow"+AID+" WHERE FollowTo="+PID);
                ResultSet rst1 = pst.executeQuery();
                ConnectionPool.returnConnection(conn);
                if(rst1.next()){
                    int postNumber = rst1.getInt(1);
                    pageNumber = postNumber/10+(postNumber%10==0?0:1);
                }
                rst1.close();
                pst.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }else{
            pageNumber=Integer.parseInt(pageNumberStr);
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
        request.setAttribute("pageNumber",pageNumber);
        request.setAttribute("currentPage",currentPage);
        Collection<Follow> follows = new ArrayList<Follow>();
        try {String a = "SELECT * FROM Follow"+AID+",User WHERE Follow"+AID+".FMaker=User.UID AND Follow"+AID+".FollowTo="+PID+" ORDER BY FCreateTime LIMIT "+(currentPage-1)*10+",10";
            conn = ConnectionPool.getConnection();
            pst = conn.prepareStatement(a);
            ResultSet rst = pst.executeQuery(a);
            ConnectionPool.returnConnection(conn);

            java.util.Date now = new java.util.Date();
            SimpleDateFormat format = new SimpleDateFormat("yyyy,MM,dd,HH,mm,ss");
            String nowTime[] = format.format(now).split(",");
            while (rst.next()){
                Follow f = new Follow();
                f.setContent(rst.getString("FContent"));
                f.setMaker(rst.getString("UID"));
                f.setMakerFollowNumber(rst.getString("UFollowNumber"));
                f.setMakerLookNumber(rst.getString("ULookNumber"));
                f.setMakerPostNumber(rst.getString("UPostNumber"));
                f.setMakerImg(rst.getString("UImg"));
                Timestamp FCreateTime = rst.getTimestamp("FCreateTime");
                f.setCreateTime(HomePageServlet.timeCompare(nowTime,FCreateTime,format));
                follows.add(f);
            }
            rst.close();
            pst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.setAttribute("follows",follows);
        RequestDispatcher dispatcher = request.getRequestDispatcher("reply.jsp");
        dispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
