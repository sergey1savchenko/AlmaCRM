package com.my.alma.model;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name="discipline")
public class Discipline {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

    @Column(name="name")
    private String name;

    @ManyToOne
    @JoinColumn(name="specialtyId", nullable=false)
    private Specialty specialty;

    @OneToMany(mappedBy="discipline")
    private Collection<Clazz> classes;

    @ManyToMany(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
    @JoinTable(name = "disciplineSkill",
               joinColumns = { @JoinColumn(name = "disciplineId") },
               inverseJoinColumns = { @JoinColumn(name = "skillId") })
    private Collection<Skill> skills;

    @OneToMany(mappedBy="discipline")
    private Collection<Review> reviews;

    public Discipline(){}

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
