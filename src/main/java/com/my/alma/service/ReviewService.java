package com.my.alma.service;

import com.my.alma.dao.ReviewRepository;
import com.my.alma.model.Review;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewService {

    @Autowired
    ReviewRepository reviewRepository;

    public List<Review> getReviews() { return reviewRepository.findAllByOrderByIdDesc(); }


}
