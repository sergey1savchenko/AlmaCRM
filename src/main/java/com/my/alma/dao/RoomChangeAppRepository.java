package com.my.alma.dao;

import com.my.alma.model.RoomChangeApp;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface RoomChangeAppRepository extends JpaRepository<RoomChangeApp, Integer> {

    List<RoomChangeApp> findAllByOrderByIdDesc();

    @Transactional
    @Modifying
    @Query(value = "UPDATE roomchangeapp " +
            "SET statusId = 2 " +
            "WHERE id = ?1", nativeQuery = true)
    void markAsArchived(final Integer responseId);

    @Transactional
    @Modifying
    @Query(value = "DELETE FROM studentroom " +
            "WHERE studentId = ?1 AND roomId = ?2", nativeQuery = true)
    void removeStudentFromRoom(final Integer studentId, final Integer roomId);

    @Transactional
    @Modifying
    @Query(value = "INSERT INTO studentroom(studentId, roomId) " +
            "VALUES(?1, ?2)", nativeQuery = true)
    void setStudentToRoom(final Integer studentId, final Integer roomToSetId);

}
