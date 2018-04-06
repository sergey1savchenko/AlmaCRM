package com.my.alma.model;

import javax.persistence.*;
import java.sql.Date;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name="class")
public class Clazz {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

    @ManyToOne
    @JoinColumn(name="disciplineId", nullable=false)
    private Discipline discipline;

    @ManyToOne
    @JoinColumn(name="classTypeId", nullable=false)
    private ClassType classType;

    @Column(name="info")
    private String info;

    @Column(name="date")
    private Date date;

    @OneToMany(mappedBy="clazz")
    private Collection<Grade> grades;

    public Clazz(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Discipline getDiscipline() {
        return discipline;
    }

    public void setDiscipline(Discipline discipline) {
        this.discipline = discipline;
    }

    public ClassType getClassType() {
        return classType;
    }

    public void setClassType(ClassType classType) {
        this.classType = classType;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Collection<Grade> getGrades() {
        return grades;
    }

    public void setGrades(Collection<Grade> grades) {
        this.grades = grades;
    }
}