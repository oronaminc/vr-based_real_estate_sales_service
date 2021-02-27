package com.ssafy.happyhouse.model;

import org.springframework.stereotype.Component;

@Component
public class BoardCommentDto {

	private String commentid;
	private String postid; // foreign key
	private String content;
	public String getCommentid() {
		return commentid;
	}
	public void setCommentid(String commentid) {
		this.commentid = commentid;
	}
	public String getPostid() {
		return postid;
	}
	public void setPostid(String postid) {
		this.postid = postid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "BoardCommentDto [commentid=" + commentid + ", postid=" + postid + ", content=" + content + "]";
	}
	
	

}
