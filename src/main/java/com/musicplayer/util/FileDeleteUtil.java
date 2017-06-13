package com.musicplayer.util;

import java.io.File;

public class FileDeleteUtil {

	public static void deleteFile(String filePath){
		File file = new File(filePath);
		if(file.exists()){
			file.delete();
		}
	}
}
