package com.example.afterSchoolLms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.afterSchoolLms.dto.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        return "home";
    }
    
    // 방과후교육 클릭시 각자의 롤로 넘어감 
    // 로그인에 있는거 이쪽으로 가져옴 -- 조서진
    @GetMapping("/afterSchool")
    public String goAfterSchool(HttpSession session) {
        User loginUser = (User) session.getAttribute("loginUser");
        if (loginUser == null) {
            return "redirect:/login";
        }
        
        // 각자의 맞는 방과후페이지로 넘어감
        switch (loginUser.getRoleId()) {
            case 1: return "redirect:/adminMain";
            case 2: return "redirect:/student/main";
            case 3: return "redirect:/teacher/main";
            case 4: return "redirect:/parent/main";
            case 5: return "redirect:/driver/main";
            default: return "redirect:/";
        }
    }
}
