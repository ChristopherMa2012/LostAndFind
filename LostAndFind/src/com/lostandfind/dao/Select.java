package com.lostandfind.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.lostandfind.dbUtility.Dbdao;
import com.lostandfind.model.Info;

public class Select {
	public List search(String sqlStr) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<Info> list = new ArrayList<Info>();
		try {
			conn = Dbdao.getConnection();
			String sql =sqlStr;
			pstm = conn.prepareStatement(sql);
			rs = pstm.executeQuery();	
			while (rs.next()) {
				Info info = new Info();
				info.setId(rs.getString("id"));
				info.setTitle(rs.getString("title"));
			    info.setPublishDate(rs.getString("publishDate"));//注意这里是字符串，但数据库里的格式是Date。密切注意能否将值取出。
			    info.setEventType(rs.getString("eventType"));
			    info.setContent(rs.getString("content"));
			    info.setProcessState(rs.getString("processState"));
			    info.setUserId(rs.getString("userId"));
				list.add(info);
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
