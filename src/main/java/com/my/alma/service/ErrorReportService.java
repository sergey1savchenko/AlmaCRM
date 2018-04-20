package com.my.alma.service;

import com.my.alma.dao.ErrorReportRepository;
import com.my.alma.model.ErrorReport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ErrorReportService {

    @Autowired
    ErrorReportRepository errorReportRepository;

    public void save(ErrorReport errorReport) { errorReportRepository.saveAndFlush(errorReport); }

    public List<ErrorReport> allErrorReports() { return errorReportRepository.findAllByOrderByIdDesc(); }

}
