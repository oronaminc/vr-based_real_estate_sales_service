package com.ssafy.happyhouse.model;

import org.springframework.stereotype.Component;

@Component
public class BoardPostDto {

	private String postid;
	private String userid;
	
	private boolean isselling;
	private String title;
	private String content;

	private String sido;
	private String gugun;
	private String dong;
	private String price;
	
	private String usertag1;
	private String usertag2;
	private String usertag3;
	
	private String housepicimg;
	private String housemapimg;
	
	private String dealtype;
	private String housetype;
	private boolean ispetallowed;
	public String getPostid() {
		return postid;
	}
	public void setPostid(String postid) {
		this.postid = postid;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public boolean isIsselling() {
		return isselling;
	}
	public void setIsselling(boolean isselling) {
		this.isselling = isselling;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDealtype() {
		return dealtype;
	}
	public void setDealtype(String dealtype) {
		this.dealtype = dealtype;
	}
	public String getHousetype() {
		return housetype;
	}
	public void setHousetype(String housetype) {
		this.housetype = housetype;
	}
	public boolean isIspetallowed() {
		return ispetallowed;
	}
	public void setIspetallowed(boolean ispetallowed) {
		this.ispetallowed = ispetallowed;
	}
	
	
	public String getUsertag1() {
		return usertag1;
	}
	public void setUsertag1(String usertag1) {
		this.usertag1 = usertag1;
	}
	public String getUsertag2() {
		return usertag2;
	}
	public void setUsertag2(String usertag2) {
		this.usertag2 = usertag2;
	}
	public String getUsertag3() {
		return usertag3;
	}
	public void setUsertag3(String usertag3) {
		this.usertag3 = usertag3;
	}
	public String getHousepicimg() {
		return housepicimg;
	}
	public void setHousepicimg(String housepicimg) {
		this.housepicimg = housepicimg;
	}
	public String getHousemapimg() {
		return housemapimg;
	}
	public void setHousemapimg(String housemapimg) {
		this.housemapimg = housemapimg;
	}
	@Override
	public String toString() {
		return "BoardPostDto [postid=" + postid + ", userid=" + userid + ", isselling=" + isselling + ", title=" + title
				+ ", content=" + content + ", sido=" + sido + ", gugun=" + gugun + ", dong=" + dong + ", dealtype="
				+ dealtype + ", housetype=" + housetype + ", ispetallowed=" + ispetallowed + "]";
	}

	


	
	
	
	
	
	
	
}
