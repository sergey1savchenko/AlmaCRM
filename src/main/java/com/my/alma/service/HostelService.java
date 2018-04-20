package com.my.alma.service;

import com.my.alma.dao.HostelRepository;
import com.my.alma.model.Hostel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class HostelService {

    @Autowired
    HostelRepository hostelRepository;

    public List<Hostel> allHostels() { return hostelRepository.findAll(); }

    public void save(Hostel hostel) { hostelRepository.saveAndFlush(hostel); }

}
