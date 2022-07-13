package accompany;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.DatabaseUtil;

public class AccompanyDAO {
	public int accompanyInsert(AccompanyDTO accompanyDTO) {
		String SQL = "INSERT INTO accompany VALUES(?,?,?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, accompanyDTO.getAccompany_course());
			pstmt.setString(2, accompanyDTO.getAccompany_host());
			pstmt.setInt(3, accompanyDTO.getAccompany_year());
			pstmt.setInt(4, accompanyDTO.getAccompany_month());
			pstmt.setInt(5, accompanyDTO.getAccompany_date());
			pstmt.setInt(6, accompanyDTO.getAccompany_hour());
			pstmt.setInt(7, accompanyDTO.getAccompany_minute());
			pstmt.setInt(8, accompanyDTO.getAccompany_headcount());
			pstmt.setString(9, accompanyDTO.getAccompany_info());
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
	
	//해당 코스에 대한 총 동행 주최 갯수
	public int getAccompanyCount(String accompany_course) {
		String SQL = "select count(*) from accompany where accompany_course=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, accompany_course);
			
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
	
	//해당 코스에 동행 일정을 ArrayList로 start부터 end까지의 내용들을 리턴
	public ArrayList<AccompanyDTO> getAccompany(String accompany_course, int accompany_year, int accompany_month, int accompany_date, int start, int end){
		ArrayList<AccompanyDTO> list = new ArrayList<AccompanyDTO>();
		String SQL = "SELECT * FROM accompany where accompany_course=? and (accompany_year>? or accompany_month>? or(accompany_year=? and accompany_month=? and accompany_date>=?)) order by accompany_year desc, accompany_month desc, accompany_date desc limit ?,? ";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,accompany_course);
			pstmt.setInt(2, accompany_year);
			pstmt.setInt(3, accompany_month);
			pstmt.setInt(4, accompany_year);
			pstmt.setInt(5, accompany_month);
			pstmt.setInt(6, accompany_date);
			pstmt.setInt(7, start-1);
			pstmt.setInt(8, end);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				AccompanyDTO accompanyDTO = new AccompanyDTO();	
				accompanyDTO.setAccompany_course(rs.getString("accompany_course"));
				accompanyDTO.setAccompany_host(rs.getString("accompany_host"));
				accompanyDTO.setAccompany_year(rs.getInt("accompany_year"));
				accompanyDTO.setAccompany_month(rs.getInt("accompany_month"));
				accompanyDTO.setAccompany_date(rs.getInt("accompany_date"));
				accompanyDTO.setAccompany_hour(rs.getInt("accompany_hour"));
				accompanyDTO.setAccompany_minute(rs.getInt("accompany_minute"));
				accompanyDTO.setAccompany_headcount(rs.getInt("accompany_headcount"));
				accompanyDTO.setAccompany_info(rs.getString("accompany_info"));
				list.add(accompanyDTO);
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
	

	//내가 해당 날짜에 다른 일정의 호스트 혹은 해당 일정의 호스트인가?
	public int hostCheck(String user_id, int accompany_year, int accompany_month, int accompany_date) {
		String SQL = "SELECT count(*) FROM accompany WHERE accompany_host=? and accompany_year=? and accompany_month=? and accompany_date=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, user_id);
			pstmt.setInt(2, accompany_year);
			pstmt.setInt(3, accompany_month);
			pstmt.setInt(4, accompany_date);
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
	
	public void refreshAccompany(int accompany_year, int accompany_month, int accompany_date) {	
		String SQL = "DELETE FROM accompany where accompany_year<? or accompany_month<? or(accompany_month=? and accompany_date<?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, accompany_year);
			pstmt.setInt(2, accompany_month);
			pstmt.setInt(3, accompany_month);
			pstmt.setInt(4, accompany_date);
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
	}
	
	public ArrayList<AccompanyDTO> getUserAccompanyList(String accompany_host){
		ArrayList<AccompanyDTO> list = new ArrayList<AccompanyDTO>();
		String SQL = "SELECT * FROM accompany where accompany_host=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,accompany_host);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				AccompanyDTO accompanyDTO = new AccompanyDTO();	
				accompanyDTO.setAccompany_course(rs.getString("accompany_course"));
				accompanyDTO.setAccompany_host(rs.getString("accompany_host"));
				accompanyDTO.setAccompany_year(rs.getInt("accompany_year"));
				accompanyDTO.setAccompany_month(rs.getInt("accompany_month"));
				accompanyDTO.setAccompany_date(rs.getInt("accompany_date"));
				accompanyDTO.setAccompany_hour(rs.getInt("accompany_hour"));
				accompanyDTO.setAccompany_minute(rs.getInt("accompany_minute"));
				accompanyDTO.setAccompany_headcount(rs.getInt("accompany_headcount"));
				accompanyDTO.setAccompany_info(rs.getString("accompany_info"));
				list.add(accompanyDTO);
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
	
	public int accompanyUpdate(AccompanyDTO accompanyDTO) {
		String SQL = "UPDATE accompany SET accompany_year=?,accompany_month=?,accompany_date=?,accompany_hour=?,accompany_minute=?,accompany_headcount=?,accompany_info=? where accompany_host=? and accompany_year=? and accompany_month=? and accompany_date=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			
			pstmt.setInt(1, accompanyDTO.getAccompany_year());
			pstmt.setInt(2, accompanyDTO.getAccompany_month());
			pstmt.setInt(3, accompanyDTO.getAccompany_date());
			pstmt.setInt(4, accompanyDTO.getAccompany_hour());
			pstmt.setInt(5, accompanyDTO.getAccompany_minute());
			pstmt.setInt(6, accompanyDTO.getAccompany_headcount());
			pstmt.setString(7, accompanyDTO.getAccompany_info());
			pstmt.setString(8, accompanyDTO.getAccompany_host());
			pstmt.setInt(9, accompanyDTO.getAccompany_year());
			pstmt.setInt(10, accompanyDTO.getAccompany_month());
			pstmt.setInt(11, accompanyDTO.getAccompany_date());
			
			
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
	
	public int accompanyDelete(String accompany_host, int accompany_year, int accompany_month, int accompany_date) {	
		String SQL = "DELETE FROM accompany where accompany_host=? and accompany_year=? and accompany_month=? and accompany_date=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, accompany_host);
			pstmt.setInt(2, accompany_year);
			pstmt.setInt(3, accompany_month);
			pstmt.setInt(4, accompany_date);
			
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
	
	public void accompanyDeleteNoUser(String accompany_host) {	
		String SQL = "DELETE FROM accompany where accompany_host=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, accompany_host);

			
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
	}
		
}