package com.my.alma.model;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name="skill")
public class Skill {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

    @Column(name="name")
    private String name;

    @Column(name="description")
    private String description;

    @ManyToMany(mappedBy = "skills")
    private Collection<Discipline> disciplines;

    @ManyToMany(mappedBy = "skills")
    private Collection<QualificationProgram> qualificationPrograms;

    public Skill(){}

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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Collection<Discipline> getDisciplines() {
        return disciplines;
    }

    public void setDisciplines(Collection<Discipline> disciplines) {
        this.disciplines = disciplines;
    }

    public Collection<QualificationProgram> getQualificationPrograms() {
        return qualificationPrograms;
    }

    public void setQualificationPrograms(Collection<QualificationProgram> qualificationPrograms) {
        this.qualificationPrograms = qualificationPrograms;
    }
}
