package participation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


import util.DatabaseUtil;

public class ParticipationDAO {
	public int participationInsert(ParticipationDTO participationDTO) {
		//participation 테이블에 데이터를 입력하는 함수
		String SQL = "INSERT INTO participation VALUES(?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			
			pstmt.setString(1, participationDTO.getParticipation_host());
			pstmt.setString(2, participationDTO.getParticipation_course());
			pstmt.setString(3, participationDTO.getParticipation_participants());
			pstmt.setInt(4, participationDTO.getParticipation_year());
			pstmt.setInt(5, participationDTO.getParticipation_month());
			pstmt.setInt(6, participationDTO.getParticipation_date());
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
	
	
	
	//호스트와 날짜에 해당하는 로우를 찾아 ArrayList를 이용해 participationDTO에 add하여 저장한다.  
	public ArrayList<ParticipationDTO> getParticipation(String participation_host,int participation_year, int participation_month, int participation_date){
		ArrayList<ParticipationDTO> list = new ArrayList<ParticipationDTO>();
		String SQL = "SELECT * FROM  participation where participation_host=? and participation_year=? and participation_month=? and participation_date=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,participation_host);
			pstmt.setInt(2, participation_year);
			pstmt.setInt(3, participation_month);
			pstmt.setInt(4, participation_date);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ParticipationDTO participationDTO = new ParticipationDTO();	
				participationDTO.setParticipation_host(rs.getString("participation_host"));
				participationDTO.setParticipation_course(rs.getString("participation_course"));
				participationDTO.setParticipation_participants(rs.getString("participation_participants"));
				participationDTO.setParticipation_year(rs.getInt("participation_year"));
				participationDTO.setParticipation_month(rs.getInt("participation_month"));
				participationDTO.setParticipation_date(rs.getInt("participation_date"));
				
				
				list.add(participationDTO);
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
	
	//내가 해당 날짜에 다른 일정의 참여자 혹은 해당 일정의 참여자인가?
	public int participationCheck(String participation_participants, int participation_year, int participation_month, int participation_date) {
		String SQL = "SELECT count(*) FROM participation WHERE participation_participants=? and participation_year=? and participation_month=? and participation_date=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, participation_participants);
			pstmt.setInt(2, participation_year);
			pstmt.setInt(3, participation_month);
			pstmt.setInt(4, participation_date);
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
	
	//해당 날짜, 호스트에 해당하는 일정의 참여자 수 리턴
	public int headcountCheck(String participation_host, int participation_year, int participation_month, int participation_date) {
		String SQL = "SELECT count(*) FROM participation WHERE participation_host=? and participation_year=? and participation_month=? and participation_date=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			
			pstmt.setString(1, participation_host);
			pstmt.setInt(2, participation_year);
			pstmt.setInt(3, participation_month);
			pstmt.setInt(4, participation_date);
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
	public void deleteParticipation(int participation_year, int participation_month, int participation_date) {	
		String SQL = "DELETE FROM participation where participation_year<? or participation_month<? or(participation_month=? and participation_date<?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, participation_year);
			pstmt.setInt(2, participation_month);
			pstmt.setInt(3, participation_month);
			pstmt.setInt(4, participation_date);
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {if(conn!=null) conn.close();}catch(Exception e) {e.printStackTrace();}
			try {if(pstmt!=null) pstmt.close();}catch(Exception e) {e.printStackTrace();}
			try {if(rs!=null) rs.close();}catch(Exception e) {e.printStackTrace();}
		}
	}
	
	
	
	public ArrayList<ParticipationDTO> getUserParticipationList(String participation_participants){
		ArrayList<ParticipationDTO> list = new ArrayList<ParticipationDTO>();
		String SQL = "SELECT * FROM  participation where participation_participants=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,participation_participants);
			
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ParticipationDTO participationDTO = new ParticipationDTO();	
				participationDTO.setParticipation_host(rs.getString("participation_host"));
				participationDTO.setParticipation_course(rs.getString("participation_course"));
				participationDTO.setParticipation_participants(rs.getString("participation_participants"));
				participationDTO.setParticipation_year(rs.getInt("participation_year"));
				participationDTO.setParticipation_month(rs.getInt("participation_month"));
				participationDTO.setParticipation_date(rs.getInt("participation_date"));
				
				
				list.add(participationDTO);
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
	
	public int participationDelete(String participation_participants, int participation_year, int participation_month, int participation_date) {	
		String SQL = "DELETE FROM participation where participation_participants=? and participation_year=? and participation_month=? and participation_date=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, participation_participants);
			pstmt.setInt(2, participation_year);
			pstmt.setInt(3, participation_month);
			pstmt.setInt(4, participation_date);
			
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
	
	public int participationDeleteNoUser(String participation_participants) {	
		String SQL = "DELETE FROM participation where participation_participants=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, participation_participants);
			
			
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
	
}
