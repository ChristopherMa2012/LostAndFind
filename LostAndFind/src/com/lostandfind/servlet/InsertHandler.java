package com.lostandfind.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lostandfind.dbUtility.Dbdao;

public class InsertHandler extends HttpServlet {
   @Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
		int line = 0;
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs=null;
		try {
			conn = Dbdao.getConnection();
			String sql = "insert into info (eventType,title,content,publishDate,processState,userId) values (?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
            pstm.setString(1, req.getParameter("eventType"));
            pstm.setString(2, req.getParameter("title"));
            pstm.setString(3, req.getParameter("content"));
            pstm.setString(4, req.getParameter("publishDate"));
            pstm.setString(5, req.getParameter("processState"));
            pstm.setString(6, req.getParameter("userId"));
			line = pstm.executeUpdate();	
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			Dbdao.closeAll(null, pstm, conn);
		}

		resp.setCharacterEncoding("UTF-8");
		PrintWriter out=resp.getWriter();
		if (line > 0) {
	    line=0;
		out.write("true");
		}else{
			out.write("false");
		}
}
}
