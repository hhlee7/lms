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
	private int roleType; 	   // [윤성권] role 별로 검색하려고 추가 했습니다.
	private String searchName; // 검색할 name
	
	// [윤성권] lastPage 를 생성자에서 생성할 때 변수에 저장되는 방식으로 변경 했습니다
	private int lastPage;
	private int pageCount = 5; // 한 화면에 보여줄 페이지 번호 개수
	private int startPage;
	private int endPage;
	
	public Page(int rowPerPage, int currentPage, int totalCount, String searchWord, String searchType, int roleType) {
		this.rowPerPage = rowPerPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.searchWord= searchWord;
		this.searchType = searchType;
		this.roleType = roleType;
		this.beginRow = (currentPage - 1) * rowPerPage;
		
		if("name".equals(searchType)) {
			this.searchName = searchWord;
		}
		
		
		// [윤성권] [1][2][3][4]... 페이지 버튼 구현하려고 추가 했습니다
		// 전체 페이지 수
		this.lastPage = (int) Math.ceil((double) totalCount / rowPerPage);

		// 페이지 그룹 시작 번호
		this.startPage = ((currentPage - 1) / pageCount) * pageCount + 1;

		// 페이지 그룹 끝 번호
		this.endPage = startPage + pageCount - 1;
		if (endPage > lastPage) {
			endPage = lastPage;
		}
	}
	public Page(int rowPerPage, int currentPage, int totalCount) {
		this.rowPerPage = rowPerPage;
		this.currentPage = currentPage;
		this.totalCount = totalCount;
		this.beginRow = (currentPage - 1) * rowPerPage;
	}
	
	// 전체 데이터 입력해서 시작,마지막 페이지 구하는 메소드
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		this.lastPage = (int) Math.ceil((double) totalCount / rowPerPage);
		this.startPage = ((currentPage - 1) / pageCount) * pageCount + 1;
		this.endPage = startPage + pageCount - 1;
		if (endPage > lastPage) {
			endPage = lastPage;
		}
	}
	
	// [윤성권] 페이징 [<<] [>>] 버튼 구현하려고 추가 했습니다
	public boolean isPrevGroup() {
	    return startPage > 1;
	}

	public boolean isNextGroup() {
	    return endPage < lastPage;
	}

	public int getPrevGroupPage() {
	    return startPage - 1;
	}

	public int getNextGroupPage() {
	    return endPage + 1;
	}
}
