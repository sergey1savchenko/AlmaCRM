package com.my.alma.dao;

import com.my.alma.model.ApplicantsApplication;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ApplicantsApplicationRepository extends JpaRepository<ApplicantsApplication, Integer> {
}
