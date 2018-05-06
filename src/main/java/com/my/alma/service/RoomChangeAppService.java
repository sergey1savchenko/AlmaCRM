package com.my.alma.service;

import com.my.alma.dao.RoomChangeAppRepository;
import com.my.alma.dao.StatusRepository;
import com.my.alma.model.RoomChangeApp;
import com.my.alma.model.Status;
import com.my.alma.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoomChangeAppService {

    @Autowired
    RoomChangeAppRepository roomChangeAppRepository;
    @Autowired
    StatusRepository statusRepository;

    public void add(String info, String wanted, Student student){
        RoomChangeApp roomChangeApp = new RoomChangeApp();
        Status status = statusRepository.findOne(1);
        roomChangeApp.setWanted(wanted);
        roomChangeApp.setInfo(info);
        roomChangeApp.setStudent(student);
        roomChangeApp.setStatus(status);
        roomChangeAppRepository.saveAndFlush(roomChangeApp);
    }

    public List<RoomChangeApp> getAll() { return roomChangeAppRepository.findAllByOrderByIdDesc(); }

    public void markAsArchived(Integer roomChangeAppId) {
        roomChangeAppRepository.markAsArchived(roomChangeAppId);
    }

    public void removeStudentFromRoom(Integer studentId, Integer roomId) {
        roomChangeAppRepository.removeStudentFromRoom(studentId, roomId);
    }

    public RoomChangeApp getById(Integer appId) {
        return roomChangeAppRepository.findOne(appId);
    }

    public void setStudentToRoom(Integer studentId, Integer roomToSetId) {
        roomChangeAppRepository.setStudentToRoom(studentId, roomToSetId);
    }
}
