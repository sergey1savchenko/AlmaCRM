package com.my.alma.service;

import com.my.alma.dao.ApplicantsApplicationRepository;
import com.my.alma.model.ApplicantsApplication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ApplicantsApplicationService {

    @Autowired
    ApplicantsApplicationRepository applicantsApplicationRepository;

    public void save(ApplicantsApplication applicantsApplication) {
        applicantsApplicationRepository.saveAndFlush(applicantsApplication);
    }

    public List<ApplicantsApplication> allApplicantsApplications(){ return applicantsApplicationRepository.findAllByOrderByIdDesc(); }

}
