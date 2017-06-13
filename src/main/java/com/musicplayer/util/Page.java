package com.musicplayer.util;

public class Page {
	
	private int pageNow = 1;//当前页数
	private int pageSize = 12;
	private int totalCount;//总的记录条数
	private int totalPageCount;//总的页数
	
	private int startPos;//开始位置从0开始
	private boolean hasFirst;//是否有首页
	private boolean hasPre;//是否有前一页
	private boolean hasNext;//是否有下一页
	private boolean hasLast;//是否有最后一页
	
	public Page( int totalCount,int pageNow) {
		super();
		this.pageNow = pageNow;
		this.totalCount = totalCount;
	}

	public int getTotalPageCount() {
		totalPageCount = getTotalCount();
		return (totalCount%pageSize==0)?totalCount/pageSize:(totalCount/pageSize)+1;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getStartPos() {
		return (pageNow - 1) * pageSize;
	}

	public void setStartPos(int startPos) {
		this.startPos = startPos;
	}

	public boolean isHasFirst() {
		return (pageNow == 1)? false:true;
	}

	public void setHasFirst(boolean hasFirst) {
		this.hasFirst = hasFirst;
	}

	public boolean isHasPre() {
		return isHasFirst()? true:false;
	}

	public void setHasPre(boolean hasPre) {
		this.hasPre = hasPre;
	}
	
	

	public boolean isHasNext() {
		return isHasLast()? true:false;
	}

	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}

	public boolean isHasLast() {
		return (pageNow == getTotalCount())?false:true;
	}

	public void setHasLast(boolean hasLast) {
		this.hasLast = hasLast;
	}

	
}
