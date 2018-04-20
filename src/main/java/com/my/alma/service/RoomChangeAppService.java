package com.my.alma.service;

import com.my.alma.dao.RoomChangeAppRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoomChangeAppService {

    @Autowired
    RoomChangeAppRepository roomChangeAppRepository;


}
