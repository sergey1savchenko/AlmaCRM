package com.my.alma.service;

import com.my.alma.dao.AgentRepository;
import com.my.alma.dao.UserRepository;
import com.my.alma.model.Agent;
import com.my.alma.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import static com.my.alma.service.util.PasswordEncoder.md5;

@Service
public class AgentService {

    @Autowired
    UserRepository userRepository;
    @Autowired
    AgentRepository agentRepository;

    public void save(User tempUser, Agent agent){
        tempUser.setPassword(md5(tempUser.getPassword()));
        userRepository.saveAndFlush(tempUser);
        User user = userRepository.getByEmail(tempUser.getEmail());
        agent.setUser(user);
        agentRepository.saveAndFlush(agent);
    }

}
