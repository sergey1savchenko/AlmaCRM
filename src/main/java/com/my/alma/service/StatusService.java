package com.my.alma.service;

import com.my.alma.dao.StatusRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StatusService {

    @Autowired
    StatusRepository statusRepository;

    //TODO by @Query getNewApplications
    //TODO by @Query getNewErrorReports
    //TODO by @Query getNewApplies
    //TODO by @Query getNewRoomChangeApps

}
