/**
 * 
 */
package com.lostandfind.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.enterprise.inject.New;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.lostandfind.dbUtility.Dbdao;

/**
 * @author ChristopherMa2012
 *
 */
public class LoginHandler extends HttpServlet {

	Connection conn = null;
	PreparedStatement pstm = null;
	ResultSet rs = null;
	boolean flag = false;
	HttpSession session=null;
	

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		
	resp.setCharacterEncoding("UTF-8");
	PrintWriter out=resp.getWriter();
	
		if(req.getParameter("logout")==null){
		try {
			conn = Dbdao.getConnection();
			String sql = "select * from user where userName=? and password=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, req.getParameter("userName"));
			pstm.setString(2, req.getParameter("password"));
			rs = pstm.executeQuery();
			while (rs.next()) {
				flag = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			// System.out.print("11");
			Dbdao.closeAll(rs, pstm, conn);
		}
		if (flag) {
			 session=req.getSession(true);
			 session.setAttribute("userName", req.getParameter("userName"));
			out.write("1");//用户名存在
           flag=false;
		} else {
         out.write("0");//用户名不存在或密码不正确
		}
		}else{
			if(req.getSession(false)!=null){
			req.getSession(false).invalidate();
			 out.write("1");
			}
		
		
	}
	out.close();
	}
}
