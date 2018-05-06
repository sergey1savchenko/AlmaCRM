package com.my.alma.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name="faculty")
public class Faculty {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

    @Column(name="name")
    private String name;

    @OneToMany(mappedBy="faculty", fetch = FetchType.EAGER)
    private Collection<Student> students;

    @JsonIgnore
    @OneToMany(mappedBy="faculty", fetch = FetchType.EAGER)
    private Collection<ApplicantsApplication> applicantsApplications;

    @JsonIgnore
    @OneToMany(mappedBy="faculty", fetch = FetchType.EAGER)
    private Collection<News> news;

    public Faculty(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Collection<Student> getStudents() {
        return students;
    }

    public void setStudents(Collection<Student> students) {
        this.students = students;
    }

    public Collection<ApplicantsApplication> getApplicantsApplications() {
        return applicantsApplications;
    }

    public void setApplicantsApplications(Collection<ApplicantsApplication> applicantsApplications) {
        this.applicantsApplications = applicantsApplications;
    }

    public Collection<News> getNews() {
        return news;
    }

    public void setNews(Collection<News> news) {
        this.news = news;
    }
}
