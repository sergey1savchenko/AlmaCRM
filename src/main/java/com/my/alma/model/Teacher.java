package com.my.alma.model;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name="teacher")
public class Teacher {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

    @Column(name="hoursForConsultations")
    private String hoursForConsultations;

    @ManyToOne
    @JoinColumn(name="facultyId", nullable=false)
    private Faculty faculty;

    @ManyToOne
    @JoinColumn(name="userId", nullable=false)
    private User user;

    @ManyToMany(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
    @JoinTable(name = "teacherClass",
            joinColumns = { @JoinColumn(name = "teacherId") },
            inverseJoinColumns = { @JoinColumn(name = "classId") })
    private Collection<Clazz> classes;

    @ManyToMany(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
    @JoinTable(name = "teacherDiscipline",
            joinColumns = { @JoinColumn(name = "teacherId") },
            inverseJoinColumns = { @JoinColumn(name = "disciplineId") })
    private Collection<Discipline> disciplines;

    public Teacher(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getHoursForConsultations() {
        return hoursForConsultations;
    }

    public void setHoursForConsultations(String hoursForConsultations) {
        this.hoursForConsultations = hoursForConsultations;
    }

    public Faculty getFaculty() {
        return faculty;
    }

    public void setFaculty(Faculty faculty) {
        this.faculty = faculty;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Collection<Clazz> getClasses() {
        return classes;
    }

    public void setClasses(Collection<Clazz> classes) {
        this.classes = classes;
    }

    public Collection<Discipline> getDisciplines() { return disciplines; }

    public void setDisciplines(Collection<Discipline> disciplines) { this.disciplines = disciplines; }
}
