package com.example.afterSchoolLms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.afterSchoolLms.dto.Notice;
import com.example.afterSchoolLms.dto.Page;

@Mapper
public interface ParentMapper {
	
	// 공지사항
	List<Notice> notice();
	
	// 공지사항 토탈카운트
	int totalCount(Page page);

	// 공지사항 상세페이지
	Notice noticeById(int noticeId);

}
