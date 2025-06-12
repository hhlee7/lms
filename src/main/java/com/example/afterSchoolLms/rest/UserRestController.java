package com.example.afterSchoolLms.rest;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.afterSchoolLms.service.AdminService;

@RestController
@RequestMapping("/user")
public class UserRestController {

    @Autowired
    private AdminService adminService;

    // GET 요청으로 userEmail 중복 체크
    @GetMapping("/checkUserEmail")
    public Map<String, Object> checkUserEmail(@RequestParam String email) {
        boolean exists = adminService.isUserEmailExists(email);  // 존재 여부 확인 서비스

        Map<String, Object> result = new HashMap<>();
        result.put("exists", exists);

        return result;
    }
}