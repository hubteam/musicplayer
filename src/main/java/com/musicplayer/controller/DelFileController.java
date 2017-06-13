package com.musicplayer.controller;

import org.junit.Test;

import com.musicplayer.util.FileDeleteUtil;

public class DelFileController {

	@Test
	public void test(){
		String filePath = "F:\\upload\\31b6460b-9eac-418a-94c9-d35fe285eb9dmusic.sql";
		FileDeleteUtil.deleteFile(filePath );
	}
}
