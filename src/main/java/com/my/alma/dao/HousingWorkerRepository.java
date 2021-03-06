package com.my.alma.dao;

import com.my.alma.model.HousingWorker;
import com.my.alma.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface HousingWorkerRepository extends JpaRepository<HousingWorker, Integer> {

    HousingWorker getByUser (User user);

}
