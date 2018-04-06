package com.my.alma.model;

import javax.persistence.*;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name="room")
public class Room {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

    @Column(name="number")
    private int number;

    @Column(name="size")
    private int size;

    @Column(name="sex")
    private byte sex;

    @ManyToOne
    @JoinColumn(name="hostelId", nullable=false)
    private Hostel hostel;

    @OneToMany(mappedBy="room")
    private Collection<RoomChangeApp> roomChangeApps;

    @OneToMany(mappedBy="room")
    private Collection<Student> students;

    public Room(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public byte getSex() {
        return sex;
    }

    public void setSex(byte sex) {
        this.sex = sex;
    }

    public Hostel getHostel() {
        return hostel;
    }

    public void setHostel(Hostel hostel) {
        this.hostel = hostel;
    }

    public Collection<RoomChangeApp> getRoomChangeApps() {
        return roomChangeApps;
    }

    public void setRoomChangeApps(Collection<RoomChangeApp> roomChangeApps) {
        this.roomChangeApps = roomChangeApps;
    }

    public Collection<Student> getStudents() {
        return students;
    }

    public void setStudents(Collection<Student> students) {
        this.students = students;
    }
}
