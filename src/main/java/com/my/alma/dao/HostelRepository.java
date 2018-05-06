package com.my.alma.dao;

import com.my.alma.model.Hostel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface HostelRepository extends JpaRepository<Hostel, Integer>{

    @Query(value = "SELECT SUM(r.size) " +
            "FROM hostel INNER JOIN room r ON hostel.id = r.hostelId " +
            "WHERE hostel.id = ?1", nativeQuery = true)
    Integer getAllPlacesInHostel(final Integer id);

    @Query(value = "SELECT COUNT(s.id) " +
            "FROM room INNER JOIN studentroom s ON room.id = s.roomId " +
            "WHERE room.hostelId = ?1", nativeQuery = true)
    Integer getBusyPlacesInHostel(final Integer id);
}
