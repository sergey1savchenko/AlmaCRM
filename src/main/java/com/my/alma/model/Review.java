package com.my.alma.model;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name="review")
public class Review {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

    @Column(name="strnghts")
    private String strnghts;

    @Column(name="weaknesses")
    private String weaknesses;

    @ManyToOne
    @JoinColumn(name="studentId", nullable=false)
    private Student student;

    @ManyToOne
    @JoinColumn(name="disciplineId", nullable=false)
    private Discipline discipline;

    public Review(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStrnghts() {
        return strnghts;
    }

    public void setStrnghts(String strnghts) {
        this.strnghts = strnghts;
    }

    public String getWeaknesses() {
        return weaknesses;
    }

    public void setWeaknesses(String weaknesses) {
        this.weaknesses = weaknesses;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Discipline getDiscipline() {
        return discipline;
    }

    public void setDiscipline(Discipline discipline) {
        this.discipline = discipline;
    }
}
