package com.wiyn.web.entity;

import java.util.Date;
import java.util.List;

public class RequestBoard {
	private String id;
	private String title;
	private String content;
	private Date regDate;
	private String memberId;
	private List<RequestComment> requestComment;
	private String boardName;
	private int page;
	private int hit;
	
	
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public List<RequestComment> getRequestComment() {
		return requestComment;
	}
	public void setRequestComment(List<RequestComment> requestComment) {
		this.requestComment = requestComment;
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	

	

}
