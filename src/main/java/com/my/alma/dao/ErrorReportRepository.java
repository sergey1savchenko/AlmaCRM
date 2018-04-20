package com.my.alma.dao;

import com.my.alma.model.ErrorReport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ErrorReportRepository extends JpaRepository<ErrorReport, Integer> {

    List<ErrorReport> findAllByOrderByIdDesc();

}
