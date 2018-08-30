package com.doraemon.cloud.bpm.controller.system;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description:
 * @Author lw
 * @date 2018/8/25 13:34
 */
@Controller
@RequestMapping("/sys")
public class LoginController {
    @RequestMapping("/login")
    public String login(){

        return "/list";
    }
}
