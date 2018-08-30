package com.doraemon.cloud.bpm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description:
 * @Author lw
 * @date 2018/8/19 14:19
 */
@Controller
public class HelloController {
    @RequestMapping("/hello")
    public String hello(Model model){
        model.addAttribute("msg", "看到这条信息说明服务注册成功");
        return "/index";
    }
}
