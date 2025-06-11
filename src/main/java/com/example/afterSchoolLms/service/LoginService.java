package com.example.afterSchoolLms.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.afterSchoolLms.dto.User;
import com.example.afterSchoolLms.mapper.LoginMapper;

@Service
public class LoginService {
	
	@Autowired LoginMapper userMapper;
}
