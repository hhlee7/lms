package com.example.afterSchoolLms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.afterSchoolLms.dto.Notice;
import com.example.afterSchoolLms.dto.Page;
import com.example.afterSchoolLms.mapper.ParentMapper;

@Service
public class ParentService {
	@Autowired ParentMapper parentMapper;
	
	// 공지사항
	public List<Notice> notice() {
		return parentMapper.notice();
	}

	public int totalCount(Page page) {
		return parentMapper.totalCount(page);
	}
	
	// 공지사항 상세 페이지
	public Notice noticeById(int noticeId) {
		return parentMapper.noticeById(noticeId);
	}
}
