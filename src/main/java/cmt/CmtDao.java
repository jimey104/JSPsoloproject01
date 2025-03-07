package cmt;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import util.DatabaseUtil;

public class CmtDao {
	
	
	
	public List<Comment> ReadAll() {
		List<Comment> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rset = null;
		
		try {
			String sql = "select * from COMMENT";
			
			conn = DatabaseUtil.getConnection();
			psmt = conn.prepareStatement(sql);
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				Comment cmt = new Comment(
						rset.getInt("vId"), rset.getString("vcomment"), rset.getString("vDate"), rset.getString("vWriter"));
				list.add(cmt);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rset==null) { try { rset.close(); } catch (Exception e) {  }}
			if(psmt==null) { try { psmt.close(); } catch (Exception e) {  }}
			if(conn==null) { try { conn.close(); } catch (Exception e) {  }}
		}
		return list;
	}
}
