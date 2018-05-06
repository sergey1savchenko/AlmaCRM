package com.my.alma.model;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name="roomChangeApp")
public class RoomChangeApp {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

    @Column(name="info")
    private String info;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="studentId", nullable=false)
    private Student student;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="statusId", nullable=false)
    private Status status;

    @JoinColumn(name="wanted", nullable=false)
    private String wanted;

    public RoomChangeApp(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public String getWanted() { return wanted; }

    public void setWanted(String wanted) { this.wanted = wanted; }

}
