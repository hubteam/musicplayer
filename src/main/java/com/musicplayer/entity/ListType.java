package com.musicplayer.entity;

public class ListType {

	private int listId;
	private int userId;
	private String listName;
	private int listCommentId;
	public int getListId() {
		return listId;
	}
	public void setListId(int listId) {
		this.listId = listId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getListName() {
		return listName;
	}
	public void setListName(String listName) {
		this.listName = listName;
	}
	public int getListCommentId() {
		return listCommentId;
	}
	public void setListCommentId(int listCommentId) {
		this.listCommentId = listCommentId;
	}
}
