package com.ssafy.happyhouse.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.model.MemberDto;
import com.ssafy.happyhouse.model.PageBean;
import com.ssafy.happyhouse.model.service.MemberService;
/**
 * Servlet implementation class MemberController
 */
@Controller
@RequestMapping("/")
public class MemberController{
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PageBean bean;
	
	

	@GetMapping(value = "/user", headers = { "Content-type=application/json" })
	public String list(@RequestParam Map<String, String> map, Model model) {
		try {
			List<MemberDto> list = memberService.listMember(map);
			model.addAttribute("members", list);
			return "user";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글목록을 얻어오는 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	
	@GetMapping(value = "/join", headers = { "Content-type=application/json" })
	public String join() {
		return "join";
	}
	
	@GetMapping(value = "/info", headers = { "Content-type=application/json" })
	public String info(@RequestParam("userid") String userid, Model model) {
		try {
			MemberDto memberdto = memberService.searchMember(userid);
			model.addAttribute("member", memberdto);
			return "info";
		}catch(Exception e){
			e.printStackTrace();
			model.addAttribute("msg", "글수정 처리 중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@PostMapping(value="/info", headers = { "Content-type=application/json" })
	public String modify(MemberDto memberDto, Model model) {
		try {
			System.out.println("여기 들어왔어?");
			memberService.updateMember(memberDto);
			System.out.println("대체 왜 이상한 곳으로 가는거야 ㅠ");
			return "redirect:user";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글수정중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@PostMapping(value="/join", headers = { "Content-type=application/json" })
	public String join(MemberDto memberDto, Model model) {
		try {
			memberService.insertMember(memberDto);
			return "index";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글수정중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
	@GetMapping(value="/delete", headers = { "Content-type=application/json" })
	public String delete(@RequestParam("userid") String userid, Model model) {
		try {
			System.out.println("들어왔니?");
			memberService.removeMember(userid);
			return "redirect:user";
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "글수정중 문제가 발생했습니다.");
			return "error/error";
		}
	}
	
//	@ResponseBody
//	@PutMapping(value = "/info", headers = { "Content-type=application/json" })
//	public void updateMember(@RequestBody MemberDto memberDto) throws Exception{
//		memberService.updateMember(memberDto);
//	}
	
	
	@ResponseBody
	@GetMapping(value="/user/search", headers = { "Content-type=application/json" })
	public List<MemberDto> searchAll() throws Exception{
		return memberService.searchAll(bean);
	}
	
	
//	@ResponseBody
//	@PostMapping(value="/user", headers = { "Content-type=application/json" })
//	public List<MemberDto> insertMember(@RequestBody MemberDto memberDto) throws Exception{
//		memberService.insertMember(memberDto);
//		return memberService.searchAll(bean);
//	}
	
//	@ResponseBody
//	@PutMapping(value = "/user", headers={ "Content-type=application/json" })
//	public List<MemberDto> updateMember(@RequestBody MemberDto memberDto) throws Exception{
//		memberService.updateMember(memberDto);
//		return memberService.searchAll(bean);
//	}
	
	@ResponseBody
	@GetMapping(value="/info/{userid}", headers = { "Content-type=application/json" })
	public MemberDto searchMember(@PathVariable("userid") String userid) throws Exception{
		return memberService.searchMember(userid);
	}
	
	@ResponseBody
	@DeleteMapping(value="/user/{userid}", headers = { "Content-type=application/json" })
	public List<MemberDto> removeMember(@PathVariable("userid") String userid) throws Exception{
		memberService.removeMember(userid);
		return memberService.searchAll(bean);
	}
	
//	@GetMapping(value="/login", headers = { "Content-type=application/json" })
//	public String login() throws Exception{
//		return "index";
//	}
	
	@PostMapping(value="/login", headers = { "Content-type=application/json" })
	public String login(@RequestParam Map<String, String> map, Model model, HttpSession session, HttpServletResponse response){
		try {
			MemberDto memberDto = memberService.login(map.get("userid"), map.get("userpwd"));
			
			if(memberDto != null) {
				session.setAttribute("userinfo", memberDto);
				
				Cookie cookie = new Cookie("ssafy_id", memberDto.getUserid());
				cookie.setPath("/");
				if("saveok".equals(map.get("idsave"))) {
					cookie.setMaxAge(60 * 60 * 24 * 365 * 40);//40년간 저장.
				} else {
					cookie.setMaxAge(0);
				}
				response.addCookie(cookie);
				//return "index";
				
			} else {
				model.addAttribute("msg", "아이디 또는 비밀번호 확인 후 로그인해 주세요.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "로그인 중 문제가 발생했습니다.");
			return "error/error";
		}
		return "redirect:/";
	}
	
	@GetMapping(value="/logout", headers = { "Content-type=application/json" })
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:/";
	}
}
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
