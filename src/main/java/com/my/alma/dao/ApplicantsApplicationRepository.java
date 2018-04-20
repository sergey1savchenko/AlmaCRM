package com.my.alma.dao;

import com.my.alma.model.ApplicantsApplication;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ApplicantsApplicationRepository extends JpaRepository<ApplicantsApplication, Integer> {

    List<ApplicantsApplication> findAllByOrderByIdDesc();
}
