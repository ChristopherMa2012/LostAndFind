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

public class RegisterHandlerServlet extends HttpServlet {
  @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
	    resp.setCharacterEncoding("UTF-8");
	    req.setCharacterEncoding("UTF-8");
		PrintWriter out=resp.getWriter();
	     int line = 0;
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs=null;
		System.out.println(req.getParameter("userName"));
		try {
			conn = Dbdao.getConnection();
			String sql = "insert into user (userName,password,contactWay) values (?,?,?)";
			pstm = conn.prepareStatement(sql);
          pstm.setString(1, req.getParameter("userName"));
          pstm.setString(2, req.getParameter("password"));
          pstm.setString(3, req.getParameter("contactWay"));
			line = pstm.executeUpdate();	
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			Dbdao.closeAll(null, pstm, conn);
		}

		
		if (line > 0) {
	    line=0;
		out.write("1");
		}else{
			out.write("0");
		}
}
}
