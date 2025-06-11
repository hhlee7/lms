package com.example.afterSchoolLms.dto;

import lombok.Data;

@Data
public class Page {
	private int rowPerPage;
	private int currentPage;
	private int beginRow;
	private int totalCount;
	private String searchWord; // 검색어
	private String searchType; // 검색타입
	private String searchName; // 검색할 name
	
	public Page(int rowPerPage, int currentPage, int totalCount) {
		this.rowPerPage = rowPerPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.beginRow = (currentPage - 1) * rowPerPage;
	}
	
	public int getLastPage() {
		int lastPage = this.totalCount / this.rowPerPage;
		if(this.totalCount % this.rowPerPage != 0) {
			lastPage += 1;
		}
		return lastPage;
	}
}
