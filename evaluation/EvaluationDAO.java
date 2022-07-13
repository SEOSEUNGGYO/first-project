package evaluation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import util.DatabaseUtil;

public class EvaluationDAO {
	public int evaluationInsert(EvaluationDTO evaluationDTO) {
		String SQL = "INSERT INTO evaluation VALUES(?,?,?,?,?,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, evaluationDTO.getEvaluation_user());
			pstmt.setString(2, evaluationDTO.getEvaluation_course());
			pstmt.setInt(3, evaluationDTO.getEvaluation_level());
			pstmt.setInt(4, evaluationDTO.getEvaluation_hour());
			pstmt.setInt(5, evaluationDTO.getEvaluation_minute());
			pstmt.setInt(6, evaluationDTO.getEvaluation_recommend());
			pstmt.setString(7, evaluationDTO.getEvaluation_info());
			
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
	
	//해당 유저가 해당 코스를 평가한 기록이 있는지 체크
	public int evaluationCheck(String evaluation_course, String evaluation_user) {
		String SQL = "select count(*) from evaluation where evaluation_user=? and evaluation_course=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, evaluation_user);
			pstmt.setString(2, evaluation_course);
			
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
	
	
	
	//해당 코스에 대한 총 평가 갯수
	public int getEvaluationCount(String evaluation_course) {
		String SQL = "select count(*) from evaluation where evaluation_course=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, evaluation_course);
			
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
	
	//해당 코스에 대한평가를 ArrayList로 start부터 end까지의 갯수를 리턴
	public ArrayList<EvaluationDTO> getEvaluation(String evaluation_course, int start, int end){
		ArrayList<EvaluationDTO> list = new ArrayList<EvaluationDTO>();
		String SQL = "SELECT * FROM evaluation where evaluation_course=? limit ?,?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,evaluation_course);
			pstmt.setInt(2, start-1);
			pstmt.setInt(3, end);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				EvaluationDTO evaluationDTO = new EvaluationDTO();	
				evaluationDTO.setEvaluation_course(rs.getString("evaluation_course"));
				evaluationDTO.setEvaluation_user(rs.getString("evaluation_user"));
				evaluationDTO.setEvaluation_hour(rs.getInt("evaluation_hour"));
				evaluationDTO.setEvaluation_minute(rs.getInt("evaluation_minute"));
				evaluationDTO.setEvaluation_level(rs.getInt("evaluation_level"));
				evaluationDTO.setEvaluation_recommend(rs.getInt("evaluation_recommend"));
				evaluationDTO.setEvaluation_info(rs.getString("evaluation_info"));
				list.add(evaluationDTO);
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
	
	//유저의 평가 내용 리스트
	public ArrayList<EvaluationDTO> getUserEvaluationList(String evaluation_user){
		ArrayList<EvaluationDTO> list = new ArrayList<EvaluationDTO>();
		String SQL = "SELECT * FROM evaluation where evaluation_user=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,evaluation_user);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				EvaluationDTO evaluationDTO = new EvaluationDTO();	
				evaluationDTO.setEvaluation_user(rs.getString("evaluation_user"));
				evaluationDTO.setEvaluation_course(rs.getString("evaluation_course"));
				evaluationDTO.setEvaluation_level(rs.getInt("evaluation_level"));
				evaluationDTO.setEvaluation_hour(rs.getInt("evaluation_hour"));
				evaluationDTO.setEvaluation_minute(rs.getInt("evaluation_minute"));
				evaluationDTO.setEvaluation_recommend(rs.getInt("evaluation_recommend"));
				evaluationDTO.setEvaluation_info(rs.getString("evaluation_info"));
				
				list.add(evaluationDTO);
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
	
	public int evaluationUpdate(EvaluationDTO evaluationDTO) {
		String SQL = "UPDATE evaluation SET evaluation_level=?,evaluation_hour=?,evaluation_minute=?,evaluation_recommend=?,evaluation_info=? where evaluation_user=? and evaluation_course=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			
			pstmt.setInt(1, evaluationDTO.getEvaluation_level());
			pstmt.setInt(2, evaluationDTO.getEvaluation_hour());
			pstmt.setInt(3, evaluationDTO.getEvaluation_minute());
			pstmt.setInt(4, evaluationDTO.getEvaluation_recommend());
			pstmt.setString(5, evaluationDTO.getEvaluation_info());
			pstmt.setString(6, evaluationDTO.getEvaluation_user());
			pstmt.setString(7, evaluationDTO.getEvaluation_course());
			
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
	
	public void evaluationDeleteNoUser(String evaluation_user) {	
		String SQL = "DELETE FROM evaluation where evaluation_user=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, evaluation_user);
			
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
