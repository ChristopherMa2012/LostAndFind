package com.lostandfind.model;

public class Info {
 private String id;
 private String title;
 private String publishDate;
 private String content;
 private String processState;
 private String eventType;
 private String userId;

 
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
public String getProcessState() {
	return processState;
}
public void setProcessState(String processState) {
	this.processState = processState;
}
public String getEventType() {
	return eventType;
}
public void setEventType(String eventType) {
	this.eventType = eventType;
}
public String getPublishDate() {
	return publishDate;
}
public void setPublishDate(String publishDate) {
	this.publishDate = publishDate;
}
public String getUserId() {
	return userId;
}
public void setUserId(String userId) {
	this.userId = userId;
}
 
}
