package com.lostandfind.dbUtility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class Dbdao {
	private static final String DRIVER_CLASS = "com.mysql.jdbc.Driver";
	private static final String DATABASE_URL = "jdbc:mysql://127.0.0.1:3306/lostandfind?characterEncoding=UTF8";
	private static final String DATABASE_USER = "root";
	private static final String DATABASE_PASSWORD = "jiyixinsui123";

	
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName(DRIVER_CLASS);
			conn = DriverManager.getConnection(DATABASE_URL, DATABASE_USER,
					DATABASE_PASSWORD);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return conn;
	}

	
	public static void closeAll(ResultSet rs, Statement stm, Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (stm != null) {
				stm.close();
			}
			if (conn != null) {
				conn.close();
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}


	public static void closeAll(ResultSet rs, PreparedStatement pstm,
			Connection conn) {
		try {
			if (rs != null) {
				rs.close();
			}
			if (pstm != null) {
				pstm.close();
			}
			if (conn != null) {
				conn.close();
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
