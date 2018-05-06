package com.my.alma.service;

import com.my.alma.dao.HostelRepository;
import com.my.alma.model.Hostel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service
public class HostelService {

    @Autowired
    HostelRepository hostelRepository;

    public List<Hostel> allHostels() {
        List<Hostel> hostels = hostelRepository.findAll();
        for(Hostel hostel : hostels){
            Integer allPlaces = hostelRepository.getAllPlacesInHostel(hostel.getId());
            Integer numOfBusy = hostelRepository.getBusyPlacesInHostel(hostel.getId());
            if(allPlaces == null)
                allPlaces = 0;
            if(numOfBusy == null)
                numOfBusy = 0;
            hostel.setFree(allPlaces - numOfBusy);
        }
        return  hostels;
    }

    public void save(Hostel hostel) { hostelRepository.saveAndFlush(hostel); }

    public Hostel getById(int id) { return hostelRepository.findOne(id); }

}
