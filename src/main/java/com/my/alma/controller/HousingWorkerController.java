package com.my.alma.controller;

import com.my.alma.dao.RoleRepository;
import com.my.alma.dao.UserRepository;
import com.my.alma.model.*;
import com.my.alma.service.HostelService;
import com.my.alma.service.HousingWorkerService;
import com.my.alma.service.NewsService;
import com.my.alma.service.RoomChangeAppService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping( "/worker" )
public class HousingWorkerController {

    @Autowired
    HousingWorkerService housingWorkerService;
    @Autowired
    RoleRepository roleRepository;
    @Autowired
    UserRepository userRepository;
    @Autowired
    NewsService newsService;
    @Autowired
    HostelService hostelService;
    @Autowired
    RoomChangeAppService roomChangeAppService;

    @RequestMapping( "/main" )
    public String main(Model model) {
        ServletRequestAttributes attr = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
        HttpSession session = attr.getRequest().getSession(true);
        User curUser = userRepository.findOne((Integer)session.getAttribute("id"));
        HousingWorker worker = housingWorkerService.getWorkerByUser(curUser);
        List<News> news = newsService.findByFacultyAndRole(null, curUser.getRole());
        List<Hostel> hostels = hostelService.allHostels();
        List<RoomChangeApp> apps = roomChangeAppService.getAll();
        model.addAttribute("news", news);
        model.addAttribute("hostels", hostels);
        model.addAttribute("apps", apps);
        return "/worker/main";
    }

    @RequestMapping( "/hostel/{id}" )
    public String hostel(Model model, @PathVariable Integer id) {
        Hostel hostel = hostelService.getById(id);
        Integer number = hostel.getRooms().size();
        List<RoomChangeApp> apps = roomChangeAppService.getAll();
        model.addAttribute("hostel", hostel);
        model.addAttribute("number", number);
        model.addAttribute("apps", apps);
        return "/worker/hostel";
    }

}
