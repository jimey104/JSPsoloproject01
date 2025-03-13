package cmt;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import util.DatabaseUtil;

public class CmtDao {
	Connection conn;
	PreparedStatement psmt;
	ResultSet rset;
	
	public List<Comment> ReadAll(String mId) {
		List<Comment> list = new ArrayList<>();
		try {
			String sql = "select * from comment where mId = ?";
			
			conn = DatabaseUtil.getConnection();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mId);
			rset = psmt.executeQuery();
			
			while(rset.next()) {
				Comment cmt = new Comment(	
						rset.getInt("vId"),
						rset.getString("mId"),
						rset.getString("vComment"),
						rset.getString("vDate"),
						rset.getString("vWriter"));
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
