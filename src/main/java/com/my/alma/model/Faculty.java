package com.my.alma.model;

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

    @OneToMany(mappedBy="faculty")
    private Collection<Student> students;

    @OneToMany(mappedBy="faculty")
    private Collection<ApplicantsApplication> applicantsApplications;

    @OneToMany(mappedBy="faculty")
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
