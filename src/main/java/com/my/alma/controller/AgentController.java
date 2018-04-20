package com.my.alma.controller;

import com.my.alma.service.AgentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/agent" )
public class AgentController {

    @Autowired
    AgentService agentService;

    @RequestMapping( "/main" )
    public String main(Model model) {
        return "/agent/main";
    }

}
