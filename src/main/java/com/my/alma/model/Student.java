package com.my.alma.model;

import javax.persistence.*;
import java.sql.Date;
import java.util.Collection;
import java.util.Objects;

@Entity
@Table(name="student")
public class Student {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

    @Column(name="dateOfBirth")
    private Date dateOfBirth;

    @Column(name="sex")
    private byte sex;

    @Column(name="entryDate")
    private Date entryDate;

    @Column(name="course")
    private int course;

    @ManyToOne
    @JoinColumn(name="facultyId", nullable=false)
    private Faculty faculty;

    @ManyToOne
    @JoinColumn(name="userId", nullable=false)
    private User user;

    @OneToMany(mappedBy="student")
    private Collection<Grade> grades;

    @ManyToOne
    @JoinTable(name = "studentRoom",
            joinColumns = { @JoinColumn(name = "studentId") },
            inverseJoinColumns = { @JoinColumn(name = "roomId") })
    private Room room;

    @OneToMany(mappedBy="student")
    private Collection<RoomChangeApp> roomChangeApps;

    @OneToMany(mappedBy="student")
    private Collection<Review> reviews;

    public Student(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public byte getSex() {
        return sex;
    }

    public void setSex(byte sex) {
        this.sex = sex;
    }

    public Date getEntryDate() {
        return entryDate;
    }

    public void setEntryDate(Date entryDate) {
        this.entryDate = entryDate;
    }

    public int getCourse() {
        return course;
    }

    public void setCourse(int course) {
        this.course = course;
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

    public Collection<Grade> getGrades() {
        return grades;
    }

    public void setGrades(Collection<Grade> grades) {
        this.grades = grades;
    }

    public Room getRoom() {
        return room;
    }

    public void setRoom(Room room) {
        this.room = room;
    }

    public Collection<RoomChangeApp> getRoomChangeApps() {
        return roomChangeApps;
    }

    public void setRoomChangeApps(Collection<RoomChangeApp> roomChangeApps) {
        this.roomChangeApps = roomChangeApps;
    }

    public Collection<Review> getReviews() {
        return reviews;
    }

    public void setReviews(Collection<Review> reviews) {
        this.reviews = reviews;
    }
}
