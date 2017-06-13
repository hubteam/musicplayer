package com.musicplayer.service;

import java.util.List;

import com.musicplayer.entity.Comment;

public interface CommentService {

	public List<Comment> showAllComment(int id);
	public void addComment(Comment comment);
	public void delComment(int id);
}
