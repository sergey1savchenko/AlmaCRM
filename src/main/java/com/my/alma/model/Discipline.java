package com.my.alma.model;

import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name="discipline")
public class Discipline {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private Integer id;

    @Column(name="name")
    private String name;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="specialtyId", nullable=false)
    private Specialty specialty;

    @JsonIgnore
    @OneToMany(mappedBy="discipline", fetch = FetchType.EAGER)
    private Collection<Clazz> classes;

    @JsonIgnore
    @ManyToMany(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
    @JoinTable(name = "disciplineSkill",
               joinColumns = { @JoinColumn(name = "disciplineId") },
               inverseJoinColumns = { @JoinColumn(name = "skillId") })
    private Collection<Skill> skills;

    @JsonIgnore
    @OneToMany(mappedBy="discipline", fetch = FetchType.EAGER)
    private Collection<Review> reviews;

    public Discipline(){}

    public Integer getId() {
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

    public Specialty getSpecialty() {
        return specialty;
    }

    public void setSpecialty(Specialty specialty) {
        this.specialty = specialty;
    }

    public Collection<Clazz> getClasses() {
        return classes;
    }

    public void setClasses(Collection<Clazz> classes) {
        this.classes = classes;
    }

    public Collection<Skill> getSkills() {
        return skills;
    }

    public void setSkills(Collection<Skill> skills) {
        this.skills = skills;
    }

    public Collection<Review> getReviews() {
        return reviews;
    }

    public void setReviews(Collection<Review> reviews) {
        this.reviews = reviews;
    }
}
