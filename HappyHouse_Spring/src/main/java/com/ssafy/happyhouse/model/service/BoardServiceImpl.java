package com.ssafy.happyhouse.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.BoardPostDto;
import com.ssafy.happyhouse.model.PageBean;
import com.ssafy.happyhouse.model.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<BoardPostDto> listPost(PageBean bean) throws Exception {
		return sqlSession.getMapper(BoardMapper.class).listPost(bean);
	}

	@Override
	public BoardPostDto getPost(String postid) throws Exception {
		return sqlSession.getMapper(BoardMapper.class).getPost(postid);
	}

	@Override
	public void insertPost(BoardPostDto post) throws Exception {
		sqlSession.getMapper(BoardMapper.class).insertPost(post);
	}

	@Override
	public void updatePost(BoardPostDto post) throws Exception {
		sqlSession.getMapper(BoardMapper.class).updatePost(post);
	}

	@Override
	public void deletePost(String postid) throws Exception {
		sqlSession.getMapper(BoardMapper.class).deletePost(postid);
	}

	@Override
	public String getSidoName(String sidocode) throws Exception {
		return sqlSession.getMapper(BoardMapper.class).getSidoName(sidocode);
	}

	@Override
	public String getGugunName(String guguncode) throws Exception {
		return sqlSession.getMapper(BoardMapper.class).getGugunName(guguncode);
	}

	@Override
	public List<BoardPostDto> searchPostsByD(String dealtype) throws Exception {
		return sqlSession.getMapper(BoardMapper.class).searchPostsByD(dealtype);
	}

	@Override
	public List<BoardPostDto> searchPostsByH(String housetype) throws Exception {
		return sqlSession.getMapper(BoardMapper.class).searchPostsByH(housetype);
	}

	@Override
	public List<BoardPostDto> searchPostsByHD(String housetype, String dealtype) throws Exception {
		return sqlSession.getMapper(BoardMapper.class).searchPostsByHD(housetype, dealtype);
	}

	@Override
	public List<BoardPostDto> searchPostsByP(String ispetallowed) throws Exception {
		return sqlSession.getMapper(BoardMapper.class).searchPostsByP(ispetallowed);
	}

	@Override
	public List<BoardPostDto> searchPostsByPD(String ispetallowed, String dealtype) throws Exception {
		return sqlSession.getMapper(BoardMapper.class).searchPostsByPD(ispetallowed,dealtype);
	}

	@Override
	public List<BoardPostDto> searchPostsByPH(String ispetallowed, String housetype) throws Exception {
		return sqlSession.getMapper(BoardMapper.class).searchPostsByPH(ispetallowed, housetype);
	}

	@Override
	public List<BoardPostDto> searchPostsByPHD(String ispetallowed, String housetype, String dealtype)
			throws Exception {
		return sqlSession.getMapper(BoardMapper.class).searchPostsByPHD(ispetallowed, housetype, dealtype);
	}

	@Override
	public List<BoardPostDto> searchPostsByS(String isselling) throws Exception {
		return sqlSession.getMapper(BoardMapper.class).searchPostsByS(isselling);
	}

	@Override
	public List<BoardPostDto> searchPostsBySD(String isselling, String dealtype) throws Exception {
		return sqlSession.getMapper(BoardMapper.class).searchPostsBySD(isselling, dealtype);
	}

	@Override
	public List<BoardPostDto> searchPostsBySH(String isselling, String housetype) throws Exception {
		return sqlSession.getMapper(BoardMapper.class).searchPostsBySH(isselling, housetype);
	}

	@Override
	public List<BoardPostDto> searchPostsBySHD(String isselling, String housetype, String dealtype) throws Exception {
		return sqlSession.getMapper(BoardMapper.class).searchPostsBySHD(isselling, housetype, dealtype);
	}

	@Override
	public List<BoardPostDto> searchPostsBySP(String isselling, String ispetallowed) throws Exception {
		return sqlSession.getMapper(BoardMapper.class).searchPostsBySP(isselling, ispetallowed);
	}

	@Override
	public List<BoardPostDto> searchPostsBySPD(String isselling, String ispetallowed, String dealtype)
			throws Exception {
		return sqlSession.getMapper(BoardMapper.class).searchPostsBySPD(isselling, ispetallowed, dealtype);
	}

	@Override
	public List<BoardPostDto> searchPostsBySPH(String isselling, String ispetallowed, String housetype)
			throws Exception {
		return sqlSession.getMapper(BoardMapper.class).searchPostsBySPH(isselling, ispetallowed, housetype);
	}

	@Override
	public List<BoardPostDto> searchPostsByAll(String isselling, String ispetallowed, String housetype, String dealtype)
			throws Exception {
		return sqlSession.getMapper(BoardMapper.class).searchPostsByAll(isselling, ispetallowed, housetype, dealtype);
	}

	
	
	


}
