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

    @ManyToOne
    @JoinColumn(name="studentId", nullable=false)
    private Student student;

    @ManyToOne
    @JoinColumn(name="wantedRoomId", nullable=false)
    private Room room;

    @ManyToOne
    @JoinColumn(name="statusId", nullable=false)
    private Status status;

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

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
