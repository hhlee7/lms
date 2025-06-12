package com.example.afterSchoolLms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class HomeController {
    @GetMapping("/")
    public String home() {
        return "home"; 
    }
    @Controller
    public class NoticeController {

        @GetMapping("/notice")
        public String noticePage() {
            return "notice"; // → /WEB-INF/views/notice.jsp
        }
    }
}
