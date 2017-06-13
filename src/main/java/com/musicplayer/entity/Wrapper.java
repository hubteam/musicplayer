package com.musicplayer.entity;

import com.musicplayer.util.Page;

public class Wrapper {

	
	private String songTypeName;
	public String getSongTypeName() {
		return songTypeName;
	}
	public void setSongTypeName(String songTypeName) {
		this.songTypeName = songTypeName;
	}
	private Page page;
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}

}
