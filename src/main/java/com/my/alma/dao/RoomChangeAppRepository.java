package com.my.alma.dao;

import com.my.alma.model.RoomChangeApp;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface RoomChangeAppRepository extends JpaRepository<RoomChangeApp, Integer> {
}