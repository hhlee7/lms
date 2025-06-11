package com.example.afterSchoolLms.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.afterSchoolLms.dto.User;


@Mapper
public interface LoginMapper {
	User login(User user);
}
