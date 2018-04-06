package com.my.alma.model;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name="agent")
public class Agent {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

    @Column(name="company")
    private String company;

    @Column(name="description")
    private String description;

    @ManyToOne
    @JoinColumn(name="userId", nullable=false)
    private User user;

    @OneToMany(mappedBy="agent")
    private Collection<QualificationProgram> qualificationprogramsById;

    @OneToMany(mappedBy="agent")
    private Collection<Vacancy> vacanciesById;

    public Agent(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Collection<QualificationProgram> getQualificationprogramsById() {
        return qualificationprogramsById;
    }

    public void setQualificationprogramsById(Collection<QualificationProgram> qualificationprogramsById) {
        this.qualificationprogramsById = qualificationprogramsById;
    }

    public Collection<Vacancy> getVacanciesById() {
        return vacanciesById;
    }

    public void setVacanciesById(Collection<Vacancy> vacanciesById) {
        this.vacanciesById = vacanciesById;
    }
}
