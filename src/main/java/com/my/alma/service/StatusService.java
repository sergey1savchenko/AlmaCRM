package com.my.alma.service;

import com.my.alma.dao.StatusRepository;
import com.my.alma.model.Status;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StatusService {

    @Autowired
    StatusRepository statusRepository;

    public Status getStatusById(Integer id) {
        return statusRepository.findOne(id);
    }

}
