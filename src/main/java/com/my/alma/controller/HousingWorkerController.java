package com.my.alma.controller;

import com.my.alma.service.HousingWorkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping( "/worker" )
public class HousingWorkerController {

    @Autowired
    HousingWorkerService housingWorkerService;

    @RequestMapping( "/main" )
    public String main(Model model) {
        return "/worker/main";
    }

}
