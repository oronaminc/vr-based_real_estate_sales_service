package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.PageBean;


public interface MemberMapper {
	public MemberDto login(String userid, String userpwd) throws SQLException;
	public void insertMember(MemberDto member) throws SQLException;
	public MemberDto getMember(String userid) throws SQLException;
	public List<MemberDto> searchAll(PageBean bean) throws SQLException;
	public int totalCount(PageBean bean) throws SQLException;
	public void removeMember(String userid) throws SQLException;
	public void updateMember(MemberDto member) throws SQLException;
	public String getForgotpwd(String hintid, String hintemail) throws SQLException;
	public List<MemberDto> listMember(Map<String, Object> map) throws SQLException;
}
