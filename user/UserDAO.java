package user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.DatabaseUtil;

public class UserDAO {
	//회원가입
	public int join(UserDTO userDTO) {
		String SQL = "INSERT INTO user VALUES(?,?,?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, userDTO.getUser_id());
			pstmt.setString(2, userDTO.getUser_pw());
			pstmt.setString(3, userDTO.getUser_name());
			pstmt.setInt(4, userDTO.getUser_year());
			pstmt.setInt(5, userDTO.getUser_month());
			pstmt.setInt(6, userDTO.getUser_day());
			pstmt.setString(7, userDTO.getUser_gender());
			pstmt.setString(8, userDTO.getUser_email());
			pstmt.setString(9, userDTO.getUser_phone());
			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		
		return -1;
	}
	//로그인
	public int login(String user_id, String user_pw) {
		String SQL = "SELECT user_pw FROM user WHERE user_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, user_id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("user_pw").equals(user_pw)) {
					return 1; //로그인 성공
				}
				else {
					return 0; //비밀번호가 틀렸어요
				}
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return -1;
	}
	//모든 유저의 리스트를 불러옴
	public ArrayList<UserDTO> getUserList(int start, int end){
		ArrayList<UserDTO> list = new ArrayList<UserDTO>();
		String SQL = "SELECT * FROM User limit ?,?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, start-1);
			pstmt.setInt(2, end);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				UserDTO userDTO = new UserDTO();	
				userDTO.setUser_id(rs.getString("user_id"));
				userDTO.setUser_pw(rs.getString("user_pw"));
				userDTO.setUser_name(rs.getString("user_name"));
				userDTO.setUser_year(rs.getInt("user_year"));
				userDTO.setUser_month(rs.getInt("user_month"));
				userDTO.setUser_day(rs.getInt("user_day"));
				userDTO.setUser_gender(rs.getString("user_gender"));
				userDTO.setUser_phone(rs.getString("user_phone"));
				userDTO.setUser_email(rs.getString("user_email"));
				list.add(userDTO);
			}
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		
		return list;
	}
	
	//파라미터의 ID값에 해당하는 유저의 정보를 불러옴
	public UserDTO getUserInfo(String user_id){
		UserDTO userDTO = new UserDTO();
		String SQL = "SELECT * FROM User where user_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, user_id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
					
				userDTO.setUser_id(rs.getString("user_id"));
				userDTO.setUser_pw(rs.getString("user_pw"));
				userDTO.setUser_name(rs.getString("user_name"));
				userDTO.setUser_year(rs.getInt("user_year"));
				userDTO.setUser_month(rs.getInt("user_month"));
				userDTO.setUser_day(rs.getInt("user_day"));
				userDTO.setUser_gender(rs.getString("user_gender"));
				userDTO.setUser_phone(rs.getString("user_phone"));
				userDTO.setUser_email(rs.getString("user_email"));
				
			}
			
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		
		return userDTO;
	}
	
	public int userUpdate(UserDTO userDTO) {
		String SQL = "UPDATE user set user_pw=?,user_name=?,user_year=?,user_month=?,user_day=?,user_gender=?,user_phone=?,user_email=? where user_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			
			pstmt.setString(1, userDTO.getUser_pw());
			pstmt.setString(2, userDTO.getUser_name());
			pstmt.setInt(3, userDTO.getUser_year());
			pstmt.setInt(4, userDTO.getUser_month());
			pstmt.setInt(5, userDTO.getUser_day());
			pstmt.setString(6, userDTO.getUser_gender());
			pstmt.setString(7, userDTO.getUser_phone());
			pstmt.setString(8, userDTO.getUser_email());
			pstmt.setString(9, userDTO.getUser_id());
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		
		return -1;
	}
	
	public int userDelete(String user_id) {	
		String SQL = "DELETE FROM user where user_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, user_id);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return -1;
	}
	
	public int getUserCount() {
		String SQL = "select count(*) from user";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
		return -1;
		
	}
	
}
