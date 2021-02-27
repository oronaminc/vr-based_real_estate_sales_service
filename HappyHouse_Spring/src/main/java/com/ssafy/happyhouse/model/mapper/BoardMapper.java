package com.ssafy.happyhouse.model.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.ssafy.happyhouse.model.BoardPostDto;
import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.PageBean;


public interface BoardMapper {
	// 게시글 관련
	public List<BoardPostDto> listPost(PageBean bean) throws SQLException;
	public BoardPostDto getPost(String postid) throws SQLException;
	public void insertPost(BoardPostDto post) throws SQLException;
	public void updatePost(BoardPostDto post) throws SQLException;
	public void deletePost(String postid) throws SQLException;
	public String getSidoName(String sidocode) throws SQLException;
	public String getGugunName(String guguncode) throws SQLException;
	
	// + 검색 
	public List<BoardPostDto> searchPostsByD(String dealtype) throws SQLException;
	public List<BoardPostDto> searchPostsByH(String housetype) throws SQLException;
	public List<BoardPostDto> searchPostsByHD(String housetype, String dealtype) throws SQLException;
	public List<BoardPostDto> searchPostsByP(String ispetallowed) throws SQLException;
	public List<BoardPostDto> searchPostsByPD(String ispetallowed, String dealtype) throws SQLException;
	public List<BoardPostDto> searchPostsByPH(String ispetallowed, String housetype) throws SQLException;
	public List<BoardPostDto> searchPostsByPHD(String ispetallowed, String housetype, String dealtype) throws SQLException;
	public List<BoardPostDto> searchPostsByS(String isselling) throws SQLException;
	public List<BoardPostDto> searchPostsBySD(String isselling, String dealtype) throws SQLException;
	public List<BoardPostDto> searchPostsBySH(String isselling, String housetype) throws SQLException;
	public List<BoardPostDto> searchPostsBySHD(String isselling, String housetype, String dealtype) throws SQLException;
	public List<BoardPostDto> searchPostsBySP(String isselling, String ispetallowed) throws SQLException;
	public List<BoardPostDto> searchPostsBySPD(String isselling, String ispetallowed, String dealtype) throws SQLException;
	public List<BoardPostDto> searchPostsBySPH(String isselling, String ispetallowed, String housetype) throws SQLException;
	public List<BoardPostDto> searchPostsByAll(String isselling, String ispetallowed, String housetype, String dealtype) throws SQLException;
	// 댓글 관련
}
