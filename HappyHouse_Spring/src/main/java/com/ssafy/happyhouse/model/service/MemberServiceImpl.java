package com.ssafy.happyhouse.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.PageBean;
import com.ssafy.happyhouse.model.ProductException;
import com.ssafy.happyhouse.model.mapper.MemberMapper;
import com.ssafy.util.DBUtil;
import com.ssafy.util.PageUtility;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public MemberDto login(String userid, String userpwd) throws Exception{
		if (userid == null || userpwd == null) return null;
		return sqlSession.getMapper(MemberMapper.class).login(userid, userpwd);
	}
	
	@Override
	public void insertMember(MemberDto member) throws Exception{
		sqlSession.getMapper(MemberMapper.class).insertMember(member);
	}
	
	public List<MemberDto> searchAll(PageBean bean)throws Exception {
		return sqlSession.getMapper(MemberMapper.class).searchAll(bean);
	}
	
	@Override
	public MemberDto searchMember(String userid)throws Exception{
		return sqlSession.getMapper(MemberMapper.class).getMember(userid);
	}
	
	public void removeMember(String userid)throws Exception {
		sqlSession.getMapper(MemberMapper.class).removeMember(userid);
	}

	@Override
	public void updateMember(MemberDto member) throws Exception {
		sqlSession.getMapper(MemberMapper.class).updateMember(member);		
	}

	@Override
	public String forgotpwd(String hintid, String hintemail)throws Exception {
		return sqlSession.getMapper(MemberMapper.class).getForgotpwd(hintid, hintemail);
	}

	@Override
	public List<MemberDto> listMember(Map<String, String> map) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("key", map.get("key") == null ? "" : map.get("key"));
		param.put("word", map.get("word") == null ? "" : map.get("word"));
		return sqlSession.getMapper(MemberMapper.class).listMember(param);
	}
}
