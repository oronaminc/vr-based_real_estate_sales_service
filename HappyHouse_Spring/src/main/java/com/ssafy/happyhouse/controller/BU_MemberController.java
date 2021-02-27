//package com.ssafy.happyhouse.controller;
//package com.ssafy.happyhouse.controller;
//
//import java.io.IOException;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.Cookie;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import com.ssafy.happyhouse.model.MemberDto;
//import com.ssafy.happyhouse.model.PageBean;
//import com.ssafy.happyhouse.model.ProductException;
//import com.ssafy.happyhouse.model.service.MemberService;
//import com.ssafy.happyhouse.model.service.MemberServiceImpl;
//
///**
// * Servlet implementation class MemberController
// */
//@WebServlet("*.member")
//public class MemberController2 extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	private MemberService memberService;
//	
//	@Override
//	public void init() throws ServletException{
//		super.init();
//		memberService = new MemberServiceImpl();
//	}
//
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		process(request, response);
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("utf-8");
//		process(request, response);
//	}
//	
//	private void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String root = request.getContextPath();
//		
//		String action = request.getServletPath();
//		try {
//			if(action !=null) {
//				if(action.endsWith("login.member")) {
//					login(request, response);
//				} else if(action.endsWith("logout.member")) {
//					logout(request, response);
//				} else if(action.endsWith("join.member")) {
//					response.sendRedirect(root + "/join.jsp");
//				} else if(action.endsWith("mvJoin.member")) {
//					insertMember(request, response);
//				} else if(action.endsWith("forgotpwd.member")) {
//					forgotpwd(request, response);
//				} else if(action.endsWith("listMember.member")) {
//					listMember(request, response);
//				} else if(action.endsWith("infoMember.member")) {
//					searchMember(request, response);
//				} else if(action.endsWith("removeMember.member")) {
//					removeMember(request, response);
//				} else if(action.endsWith("updateMember.member")) {
//					updateMember(request, response);
//				} else {
//					response.sendRedirect(root);
//				}
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//			request.setAttribute("msg",e.getMessage());
//			request.getRequestDispatcher("/error/error.jsp").forward(request, response);
//		}
//	}
//	
//	private void forgotpwd(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String path = "/index.jsp";
//		try {
//			String hintid = request.getParameter("hintid");
//			String hintemail = request.getParameter("hintemail");
//			request.setAttribute("getpwd", memberService.forgotpwd(hintid, hintemail));
//			System.out.println(memberService.forgotpwd(hintid, hintemail));
//			request.getRequestDispatcher(path).forward(request, response);
//		}catch (ArithmeticException e) {
//			throw new ProductException("조회할 회원이 없습니다.");
//		}
//	}
//
//	private void insertMember(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String path = "/index.jsp";
//		try {
//			MemberDto member = new MemberDto();
//			member.setUserid(request.getParameter("userId"));
//			member.setUsername(request.getParameter("userName"));
//			member.setUserpwd(request.getParameter("userPwd"));
//			member.setEmail(request.getParameter("userEmail"));
//			member.setPhone(request.getParameter("userPhone"));
//			member.setAddress(request.getParameter("userAddr"));
//			try {
//				memberService.insertMember(member);
//			} catch (Exception e) {
//				e.printStackTrace();
//				request.setAttribute("msg", e.getMessage());
//				path = "/error/error.jsp";
//			}
//		} catch (Exception e) {
//			request.setAttribute("msg","회원 가입 실패");
//		}
//		request.getRequestDispatcher(path).forward(request, response);
//	}
//	
//	private void removeMember(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException {
//		String userid = request.getParameter("userid");
//		memberService.removeMember(userid);
//		response.sendRedirect(request.getContextPath());
//	}
//	
//	private void updateMember(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException {
//		String path = "/listMember.jsp";
//		try {
//			MemberDto member = new MemberDto();
//			member.setUserid(request.getParameter("userID"));
//			member.setUsername(request.getParameter("userNAME"));
//			member.setUserpwd(request.getParameter("userPWD"));
//			member.setEmail(request.getParameter("userEMAIL"));
//			member.setPhone(request.getParameter("userPHONE"));
//			member.setAddress(request.getParameter("userADDR"));
//			try {
//				memberService.updateMember(member);
//			} catch (Exception e) {
//				e.printStackTrace();
//				request.setAttribute("msg", e.getMessage());
//				path = "/error/error.jsp";
//			}
//		} catch (Exception e) {
//			request.setAttribute("msg","회원 가입 실패");
//		}
//		request.getRequestDispatcher(path).forward(request, response);
//	}
//	
//	private void searchMember(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException {
//		String path = "/infoMember.jsp";
//		try {
//			String userid = request.getParameter("userid");
//			request.setAttribute("member", memberService.searchMember(userid));
//			request.getRequestDispatcher(path).forward(request, response);
//		}catch (ArithmeticException e) {
//			throw new ProductException("조회할 회원이 없습니다.");
//		}
//	}
//	
//	private void listMember(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException  {
//		String path = "/listMember.jsp";
//		String key  = request.getParameter("key"); 
//		String word = request.getParameter("word"); 
//		String pageNo=request.getParameter("pageNo"); 
//		
//		PageBean bean = new PageBean(key, word, pageNo);
//		
//		request.setAttribute("list", memberService.searchAll(bean));
//		request.setAttribute("bean", bean);
//		
//		request.getRequestDispatcher(path).forward(request, response);
//	}
//	
//	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String path = "/index.jsp";
//		String userid = request.getParameter("userid");
//		String userpwd = request.getParameter("userpwd");
//		try {
//			MemberDto memberDto = memberService.login(userid, userpwd);
//			if(memberDto != null) { // 받은 값 있으면 = 로그인 성공이면
//				// session 설정
//				HttpSession session = request.getSession();
//				session.setAttribute("userinfo", memberDto);
//				
//			} else {
//				request.setAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인 해주세요.");
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//			request.setAttribute("msg", "로그인 중 문제가 발생했습니다.");
//			path = "/error/error.jsp";
//		}
//		request.getRequestDispatcher(path).forward(request, response);
//	}
//	
//	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
//		HttpSession session = request.getSession();
//		session.invalidate();
//		response.sendRedirect(request.getContextPath());
//	}
//	
//}
