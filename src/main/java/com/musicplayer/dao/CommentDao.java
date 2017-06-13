package com.musicplayer.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.musicplayer.entity.Comment;
@Repository(value="commentDao")
public interface CommentDao {
	List<Comment> selectComment(int id);
	void insertComment(Comment comment);
	void deleteComment(int id);
	

}
