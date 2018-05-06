package com.my.alma.service;

import com.my.alma.dao.DisciplineRepository;
import com.my.alma.model.Discipline;
import com.my.alma.model.Review;
import com.my.alma.model.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class DisciplineService {

    @Autowired
    DisciplineRepository disciplineRepository;

    public void save(Discipline discipline){ disciplineRepository.saveAndFlush(discipline);}

    public List<Discipline> allDisciplines() { return disciplineRepository.findAll(); }

    public Discipline getById(Integer id){ return disciplineRepository.getOne(id); }

    public List<Discipline> getDisciplinesByStudentId(Integer studentId) {
        return disciplineRepository.getDisciplinesByStudentId(studentId);
    }

    public List<Discipline> getNotReviewedDisciplinesByStudent(Student student) {
        List<Discipline> disciplines = getDisciplinesByStudentId(student.getId());
        HashSet<Review> reviews = student.getSetOfReviews();
        HashSet<Integer> setOfReviewedDisciplineIds = new HashSet<Integer>();
        for(Review r : reviews)
            setOfReviewedDisciplineIds.add(r.getDiscipline().getId());
        HashSet<Discipline> result = new HashSet<Discipline>();
        for(Discipline d : disciplines){
            if(reviews.isEmpty()){
                result.add(d);
            }else{
                if(!setOfReviewedDisciplineIds.contains(d.getId())){
                    result.add(d);
                }
            }
        }
        return new ArrayList<Discipline>(result);
    }

    public List<Discipline> getDisciplinesBySkill(Integer skillId) {
        return disciplineRepository.getDisciplinesBySkill(skillId);
    }

}
