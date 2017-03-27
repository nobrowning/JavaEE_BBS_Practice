package Servlet;

import Pool.ConnectionPool;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Created by duchenguang on 2017/1/13.
 */
public class DeletePostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String AID = request.getParameter("AID");
        String PID = request.getParameter("PID");
        try {
            Connection conn = ConnectionPool.getConnection();
            Statement st = conn.createStatement();
            st.execute("DELETE  From Post"+AID+" WHERE PID='"+PID+"'");
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
