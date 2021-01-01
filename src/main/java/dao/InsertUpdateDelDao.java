package dao;

import util.DBConn;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class InsertUpdateDelDao {
	
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	
	public int insertANDupdateANDdel(String sql){
		int temp = 0;
		conn = DBConn.getConn();
		
		try {
			st = conn.createStatement();
			temp = st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO �Զ����� catch ��
			e.printStackTrace();
			temp = -1;
		} finally{
			DBConn.close(conn,st,rs);
		}
		return temp;
	}

}
