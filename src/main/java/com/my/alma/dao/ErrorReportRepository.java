package com.my.alma.dao;

import com.my.alma.model.ErrorReport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ErrorReportRepository extends JpaRepository<ErrorReport, Integer> {
}
