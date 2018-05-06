package com.my.alma.dao;

import com.my.alma.model.Agent;
import com.my.alma.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AgentRepository extends JpaRepository<Agent, Integer> {

    Agent getByUser (User user);

}
