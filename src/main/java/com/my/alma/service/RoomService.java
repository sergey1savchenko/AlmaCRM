package com.my.alma.service;

import com.my.alma.dao.RoomRepository;
import com.my.alma.model.Room;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoomService {

    @Autowired
    RoomRepository roomRepository;

    public void save(Room room) { roomRepository.saveAndFlush(room); }
}
