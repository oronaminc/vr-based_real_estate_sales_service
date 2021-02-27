package com.ssafy.happyhouse.model.service;

import java.util.List;

import com.ssafy.happyhouse.model.BoardPostDto;
import com.ssafy.happyhouse.model.PageBean;

public interface BoardService {
	
	// 게시글 관련
	public List<BoardPostDto> listPost(PageBean bean) throws Exception;
	public BoardPostDto getPost(String postid) throws Exception;
	public void insertPost(BoardPostDto post) throws Exception;
	public void updatePost(BoardPostDto post) throws Exception;
	public void deletePost(String postid) throws Exception;
	public String getSidoName(String sidocode) throws Exception;
	public String getGugunName(String guguncode) throws Exception;
	// + 검색 
	
	public List<BoardPostDto> searchPostsByD(String dealtype) throws Exception;
	public List<BoardPostDto> searchPostsByH(String housetype) throws Exception;
	public List<BoardPostDto> searchPostsByHD(String housetype, String dealtype) throws Exception;
	public List<BoardPostDto> searchPostsByP(String ispetallowed) throws Exception;
	public List<BoardPostDto> searchPostsByPD(String ispetallowed, String dealtype) throws Exception;
	public List<BoardPostDto> searchPostsByPH(String ispetallowed, String housetype) throws Exception;
	public List<BoardPostDto> searchPostsByPHD(String ispetallowed, String housetype, String dealtype) throws Exception;
	public List<BoardPostDto> searchPostsByS(String isselling) throws Exception;
	public List<BoardPostDto> searchPostsBySD(String isselling, String dealtype) throws Exception;
	public List<BoardPostDto> searchPostsBySH(String isselling, String housetype) throws Exception;
	public List<BoardPostDto> searchPostsBySHD(String isselling, String housetype, String dealtype) throws Exception;
	public List<BoardPostDto> searchPostsBySP(String isselling, String ispetallowed) throws Exception;
	public List<BoardPostDto> searchPostsBySPD(String isselling, String ispetallowed, String dealtype) throws Exception;
	public List<BoardPostDto> searchPostsBySPH(String isselling, String ispetallowed, String housetype) throws Exception;
	public List<BoardPostDto> searchPostsByAll(String isselling, String ispetallowed, String housetype, String dealtype) throws Exception;
	// 댓글 관련
	
}
