package com.lostandfind.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lostandfind.dbUtility.Dbdao;
import com.lostandfind.model.User;

public class UserGet {
	public List search(String str) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<User> list = new ArrayList<User>();
		try {
			conn = Dbdao.getConnection();
			String sql = "select * from user where userName=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, str);
			rs = pstm.executeQuery();	
			while (rs.next()) {
				User user = new User();
				user.setId(rs.getString("id"));
		        list.add(user);
			}
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		finally {
			// System.out.print("11");
			Dbdao.closeAll(rs, pstm, conn);
		}
		return list;
	}
}
