package com.my.alma.model;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name="grade")
public class Grade {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

    @Column(name="presence", nullable = true)
    private Byte presence;

    @Column(name="mark", nullable = true)
    private Integer mark;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="studentId", nullable=false)
    private Student student;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="classId", nullable=false)
    private Clazz clazz;

    public Grade(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public byte getPresence() {
        return presence;
    }

    public void setPresence(byte presence) {
        this.presence = presence;
    }

    public int getMark() {
        return mark;
    }

    public void setMark(int mark) {
        this.mark = mark;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Clazz getClazz() {
        return clazz;
    }

    public void setClazz(Clazz clazz) {
        this.clazz = clazz;
    }
}
