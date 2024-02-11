package com.tech.blog.servelets;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LikeServlet extends HttpServlet {

   protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    try {
        String operation = request.getParameter("operation");
        int uid = Integer.parseInt(request.getParameter("uid"));
        int pid = Integer.parseInt(request.getParameter("pid"));
        LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());

        if (operation.equals("like")) {
            boolean f = ldao.insertLike(pid, uid);
            out.println(f);
        }
    } catch (Exception e) {
        // Handle SQL exceptions
        e.printStackTrace();
        
    } 
}
}
