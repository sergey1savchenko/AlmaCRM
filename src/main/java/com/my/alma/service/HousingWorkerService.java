package com.my.alma.service;

import com.my.alma.dao.HousingWorkerRepository;
import com.my.alma.dao.UserRepository;
import com.my.alma.model.HousingWorker;
import com.my.alma.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.my.alma.service.util.PasswordEncoder.md5;

@Service
public class HousingWorkerService {

    @Autowired
    UserRepository userRepository;
    @Autowired
    HousingWorkerRepository housingWorkerRepository;

    public HousingWorker getWorkerByUser(User user) { return housingWorkerRepository.getByUser(user); }

    public void save(User tempUser){
        tempUser.setPassword(md5(tempUser.getPassword()));
        userRepository.saveAndFlush(tempUser);
        User user = userRepository.getByEmail(tempUser.getEmail());
        HousingWorker housingWorker = new HousingWorker();
        housingWorker.setUser(user);
        housingWorkerRepository.saveAndFlush(housingWorker);
    }

}
