package com.wiyn.web.entity;

import java.util.Date;
import java.util.List;

public class SiteBoard {
	
	private String id;
	private String title;
	private String content;
	private Date regDate;
	private String factBoardId;
	private String factBoardName;
	private int hit;
	private String memberId;
	private String userProfile;
	
	private List<SiteComment> siteComments;
	private int countcomment;
	
	private String news;
	private String good;
	
	
	
	
	private int likeCount;
	
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
	
	public String getFactBoardId() {
		return factBoardId;
	}
	public void setFactBoardId(String factBoardId) {
		this.factBoardId = factBoardId;
	}
	public String getFactBoardName() {
		return factBoardName;
	}
	public void setFactBoardName(String factBoardName) {
		this.factBoardName = factBoardName;
	}

	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getUserProfile() {
		return userProfile;
	}
	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}
	
	public List<SiteComment> getSiteComments() {
		return siteComments;
	}
	public void setSiteComments(List<SiteComment> siteComments) {
		this.siteComments = siteComments;
	}
	public int getCountcomment() {
		return countcomment;
	}
	public void setCountcomment(int countcomment) {
		this.countcomment = countcomment;
	}
	public String getNews() {
		return news;
	}
	public void setNews(String news) {
		this.news = news;
	}
	
	public String getGood() {
		return good;
	}
	public void setGood(String good) {
		this.good = good;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	

}
