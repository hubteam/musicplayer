package com.musicplayer.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.musicplayer.dao.CommentDao;
import com.musicplayer.entity.Comment;
import com.musicplayer.service.CommentService;

@Service(value="commentService")
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentDao commentDao;
	
	public List<Comment> showAllComment(int id) {
		// TODO Auto-generated method stub
		return commentDao.selectComment(id);
	}

	public void addComment(Comment comment) {
		// TODO Auto-generated method stub
		commentDao.insertComment(comment);
	}

	public void delComment(int id) {
		// TODO Auto-generated method stub
		commentDao.deleteComment(id);
	}

}
