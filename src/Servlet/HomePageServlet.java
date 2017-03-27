package Servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import Pool.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import Beans.Area;

/**
 * Created by duchenguang on 2017/1/9.
 */
public class HomePageServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Collection<Area> areas= new ArrayList<Area>();
        try {
            Connection conn = ConnectionPool.getConnection();
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM Area");
            ResultSet rst = pst.executeQuery();
            ConnectionPool.returnConnection(conn);
            Date now = new Date();
            SimpleDateFormat format = new SimpleDateFormat("yyyy,MM,dd,HH,mm,ss");
            String nowTime[] = format.format(now).split(",");
            while (rst.next()){
                Area a = new Area();
                a.setAClass(rst.getString("AClass"));
                a.setAFollowsNumber(rst.getInt("AFollowsNumber"));
                a.setAID(rst.getInt("AID"));
                a.setAInfo(rst.getString("AInfo"));
                a.setALastPost(rst.getInt("ALastPost"));
                a.setALastPostTitle(rst.getString("ALastPostTitle"));
                a.setATodayNew(rst.getInt("ATodayNew"));
                a.setALastUser(rst.getString("ALastUser"));
                a.setASize(rst.getInt("ASize"));
                a.setATitle(rst.getString("ATitle"));
                a.setAManager(rst.getString("AManager"));
                a.setALastUserImg(rst.getString("ALastUserImg"));
                a.setStatement(rst.getString("Statement"));
                Timestamp ALastTime = rst.getTimestamp("ALastTime");
                if(ALastTime!=null){
                    a.setALastTime(timeCompare(nowTime,ALastTime,format));
                }else{
                    a.setALastTime("——");
                }
                areas.add(a);
            }
            rst.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        request.setAttribute("Areas",areas);
        RequestDispatcher dispatcher = request.getRequestDispatcher("HomePage.jsp");
        dispatcher.forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    public static String timeCompare(String []nowTime,Timestamp t,SimpleDateFormat format){

        String buildDateString = format.format(t);
        String time[] = buildDateString.split(",");
        if(!time[0].equals(nowTime[0])||!time[1].equals(nowTime[1])){//年或者月不等
            SimpleDateFormat format2 = new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
            return format2.format(t);
        }else if(!time[2].equals(nowTime[2])){//日不等
            int days = Integer.parseInt(nowTime[2])-Integer.parseInt(time[2]);
            return days+"天前";
        }else if(!time[3].equals(nowTime[3])){//小时不等
            int hours = Integer.parseInt(nowTime[3])-Integer.parseInt(time[3]);
            return hours+"小时前";
        }else if(!time[4].equals(nowTime[4])){//分钟不等
            int minutes = Integer.parseInt(nowTime[4])-Integer.parseInt(time[4]);
            return minutes+"分钟前";
        }else{
            return"刚刚";
        }
    }
}
