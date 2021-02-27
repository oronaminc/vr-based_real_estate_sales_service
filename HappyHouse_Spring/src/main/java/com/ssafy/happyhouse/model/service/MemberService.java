package com.ssafy.happyhouse.model.service;

import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.PageBean;

public interface MemberService {
	public MemberDto login(String userid, String userpwd) throws Exception;
	public void insertMember(MemberDto member) throws Exception;
	public MemberDto searchMember(String userid)throws Exception ;
	public List<MemberDto> searchAll(PageBean bean) throws Exception;
	public List<MemberDto> listMember(Map<String, String> map) throws Exception;
	public void removeMember(String userid)throws Exception;
	public void updateMember(MemberDto member) throws Exception;
	public String forgotpwd(String hintid, String hintemail)throws Exception;
}
