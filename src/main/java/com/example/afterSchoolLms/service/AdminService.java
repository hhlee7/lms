package com.example.afterSchoolLms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.afterSchoolLms.dto.Page;
import com.example.afterSchoolLms.dto.Role;
import com.example.afterSchoolLms.dto.User;
import com.example.afterSchoolLms.mapper.AdminMapper;

@Service
public class AdminService {
	@Autowired AdminMapper adminMapper;
	
	/** 리스트 전체 카운트 가져오기 **/
	public int getTotalCount(Page page) {
		return adminMapper.getTotalCount(page);
	}
	
	/** 관리자가 유저 리스트를 가져옴 **/
	public List<User> selectUserList(Page page){
		return adminMapper.selectUserList(page);
	}
	
	/** 역할 리스트를 가져옴 **/
	public List<Role> selectRoleList(){
		return adminMapper.selectRoleList();
	}
}
