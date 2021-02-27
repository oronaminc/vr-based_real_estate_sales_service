package com.ssafy.happyhouse.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.PageBean;
import com.ssafy.util.DBUtil;

public class MemberDaoImpl implements MemberDao {

	@Override
	public MemberDto login(String userid, String userpwd) throws SQLException {
		MemberDto member = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select username, userid, email, phone, address \n");
			sql.append("from member \n");
			sql.append("where userid = ? and userpwd = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userid);
			pstmt.setString(2, userpwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				member = new MemberDto();
				member.setUserid(rs.getString("userid"));
				member.setUsername(rs.getString("username"));
				member.setEmail(rs.getString("email"));
				member.setPhone(rs.getString("phone"));
				member.setAddress(rs.getString("address"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			member = null;
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		}
		return member;
	}

	@Override
	public void insertMember(Connection conn, MemberDto member) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			StringBuilder insertMember = new StringBuilder();
			insertMember.append("insert into member \n");
			insertMember.append("values(?, ?, ?, ?, ?, ?)");
			pstmt = conn.prepareStatement(insertMember.toString());
			pstmt.setString(1, member.getUserid());
			pstmt.setString(2, member.getUserpwd());
			pstmt.setString(3, member.getUsername());
			pstmt.setString(4, member.getEmail());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getAddress());
			pstmt.executeUpdate();
		} finally {
			DBUtil.close(pstmt);
		}
	}

	@Override
	public MemberDto getMember(String userid) throws SQLException {
		MemberDto member = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			
			sql.append(" select * \n");
			sql.append(" from member \n");
			sql.append(" where userid = ? ");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				member = new MemberDto();
				member.setUserid(rs.getString("userid"));
				member.setUserpwd(rs.getString("userpwd"));
				member.setUsername(rs.getString("username"));
				member.setEmail(rs.getString("email"));
				member.setPhone(rs.getString("phone"));
				member.setAddress(rs.getString("address"));
			}
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		}
		return member;
	} 
	
	public List<MemberDto> searchAll(Connection conn, PageBean bean) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<MemberDto> list = new LinkedList<MemberDto>();
		try {
			String key = bean.getKey();
			String word= bean.getWord();
			int startNo= bean.getStartNo();
			int interval=bean.getInterval();
			
			StringBuilder sql = new StringBuilder();
			sql.append(" select * from member  \n");
			//검색 조건에 맞는 쿼리 작성 => 동적 쿼리 
			if(key != null && !key.equals("all") && word !=null && !word.trim().equals("")) {
				if(key.equals("username")) {
					sql.append(" where username like ? \n");
				}else if(key.equals("userid")) {
					sql.append(" where userid like ? \n");
				}
			}
			sql.append(" order by userid  limit  ?, ? ");
			
			pstmt = conn.prepareStatement(sql.toString());

			//데이타 설정 
			int idx = 1;  //? 번호를 위한 변수   => 조건에 따라서 ?의 번호가 달라지므로 변수를 사용한다. 
			
			if(key != null && !key.equals("all") && word != null && !word.trim().equals("")) {
				if(key.equals("username")) {
					pstmt.setString(idx++, "%"+word+"%");
				}else if(key.equals("userid")) {
					pstmt.setString(idx++, "%"+word+"%");
				}
			}
			
			pstmt.setInt(idx++, startNo);
			pstmt.setInt(idx++, interval);
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				MemberDto member = new MemberDto();
				member.setUserid(rs.getString("userid"));
				member.setUserpwd(rs.getString("userpwd"));
				member.setUsername(rs.getString("username"));
				member.setEmail(rs.getString("email"));
				member.setPhone(rs.getString("phone"));
				member.setAddress(rs.getString("address"));
				list.add(member);
			}
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		return list;
	}
	public int totalCount(Connection conn, PageBean bean) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String key = bean.getKey();
			String word= bean.getWord();
			int startNo= bean.getStartNo();
			int interval=bean.getInterval();
			
			StringBuilder sql = new StringBuilder();
			sql.append(" select count(*) as cnt from member  \n");
			//검색 조건에 맞는 쿼리 작성 => 동적 쿼리 
			if(key != null && !key.equals("all") && word !=null && !word.trim().equals("")) {
				if(key.equals("username")) {
					sql.append(" where username like ? \n");
				}else if(key.equals("userid")) {
					sql.append(" where userid like ? \n");
				}
			}
			pstmt = conn.prepareStatement(sql.toString());

			if(key != null && !key.equals("all") && word != null && !word.trim().equals("")) {
				if(key.equals("username")) {
					pstmt.setString(1, "%"+word+"%");
				}else if(key.equals("userid")) {
					pstmt.setString(1, "%"+word+"%");
				}
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt("cnt");
			}
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
		}
		return 1;
	}
	public void removeMember(String userid) throws SQLException{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBUtil.getConnection();
			String sql = " delete from member where userid like ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.executeUpdate();
		} finally {
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		}
	}

	@Override
	public void updateMember(Connection conn, MemberDto member) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			StringBuilder updateMember = new StringBuilder();
			updateMember.append("update member \n");
			updateMember.append("set userpwd = ?, username = ?, email = ?, phone = ?, address = ? \n");
			updateMember.append("where userid = ?");
			pstmt = conn.prepareStatement(updateMember.toString());
			pstmt.setString(1, member.getUserpwd());
			pstmt.setString(2, member.getUsername());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getUserid());
			pstmt.executeUpdate();
		} finally {
			DBUtil.close(pstmt);
		}
		
	}

	@Override
	public String getForgotpwd(String hintid, String hintemail) throws SQLException {
		String getpwd = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil.getConnection();
			StringBuilder sql = new StringBuilder();
			sql.append("select userpwd \n");
			sql.append("from member \n");
			sql.append("where userid = ? and email = ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, hintid);
			pstmt.setString(2, hintemail);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				getpwd = rs.getString("userpwd");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBUtil.close(rs);
			DBUtil.close(pstmt);
			DBUtil.close(conn);
		}
		return getpwd;
	}

}
