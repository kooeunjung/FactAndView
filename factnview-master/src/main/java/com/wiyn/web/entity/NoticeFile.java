package com.wiyn.web.entity;

import java.sql.Date;

public class NoticeFile {
	
	private String id;
	private String src;
	private String name;
	private String noticeBoardId;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNoticeBoardId() {
		return noticeBoardId;
	}
	public void setNoticeBoardId(String noticeBoardId) {
		this.noticeBoardId = noticeBoardId;
	}
	
	

	
}
