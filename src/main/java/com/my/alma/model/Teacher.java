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
    private Faculty facultyByFacultyId;

    @ManyToOne
    @JoinColumn(name="userId", nullable=false)
    private User userById;

    @ManyToMany(cascade = { CascadeType.ALL })
    @JoinTable(name = "teacherClass",
            joinColumns = { @JoinColumn(name = "teacherId") },
            inverseJoinColumns = { @JoinColumn(name = "classId") })
    private Collection<Clazz> classes;

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

    public Faculty getFacultyByFacultyId() {
        return facultyByFacultyId;
    }

    public void setFacultyByFacultyId(Faculty facultyByFacultyId) {
        this.facultyByFacultyId = facultyByFacultyId;
    }

    public User getUserById() {
        return userById;
    }

    public void setUserById(User userById) {
        this.userById = userById;
    }

    public Collection<Clazz> getClasses() {
        return classes;
    }

    public void setClasses(Collection<Clazz> classes) {
        this.classes = classes;
    }
}
