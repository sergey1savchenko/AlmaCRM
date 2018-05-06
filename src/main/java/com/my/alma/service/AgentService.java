package com.my.alma.service;

import com.my.alma.dao.AgentRepository;
import com.my.alma.dao.QuestionFromStudentRepository;
import com.my.alma.dao.UserRepository;
import com.my.alma.model.Agent;
import com.my.alma.model.QuestionFromStudent;
import com.my.alma.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.my.alma.service.util.PasswordEncoder.md5;

@Service
public class AgentService {

    @Autowired
    UserRepository userRepository;
    @Autowired
    AgentRepository agentRepository;
    @Autowired
    QuestionFromStudentRepository questionFromStudentRepository;

    public List<Agent> findAll() { return agentRepository.findAll(); }

    public void save(User tempUser, Agent agent){
        tempUser.setPassword(md5(tempUser.getPassword()));
        userRepository.saveAndFlush(tempUser);
        User user = userRepository.getByEmail(tempUser.getEmail());
        agent.setUser(user);
        agentRepository.saveAndFlush(agent);
    }

    public Agent getAgentByUser(User user) { return agentRepository.getByUser(user); }

    public Agent getAgentById(Integer id) { return agentRepository.findOne(id); }

    public List<QuestionFromStudent> questionFromStudentsByAgentId(Integer agentId) {
        return questionFromStudentRepository.questionFromStudentsByAgentId(agentId);
    }

}
