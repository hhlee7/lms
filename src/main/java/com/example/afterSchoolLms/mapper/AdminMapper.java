package com.example.afterSchoolLms.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.afterSchoolLms.dto.Page;
import com.example.afterSchoolLms.dto.Role;
import com.example.afterSchoolLms.dto.User;

@Mapper
public interface AdminMapper {
	
	List<User> selectUserList(Page page);	// 전체 회원 조회
	int getTotalCount(Page page);			// 전체 데이터 수 조회
	List<Role> selectRoleList();			// 역할 리스트 조회
}
