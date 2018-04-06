package com.my.alma.model;

import javax.persistence.*;
import java.util.Arrays;
import java.util.Objects;

@Entity
@Table(name="studentsApplied")
public class StudentsApplied {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

    @Column(name="resume")
    private byte[] resume;

    @Column(name="fileExtension")
    private String fileExtension;

    @ManyToOne
    @JoinColumn(name="studentId", nullable=false)
    private Student student;

    @ManyToOne
    @JoinColumn(name="vacancyId", nullable=false)
    private Vacancy vacancy;

    @ManyToOne
    @JoinColumn(name="statusId", nullable=false)
    private Status status;

    public StudentsApplied(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public byte[] getResume() {
        return resume;
    }

    public void setResume(byte[] resume) {
        this.resume = resume;
    }

    public String getFileExtension() {
        return fileExtension;
    }

    public void setFileExtension(String fileExtension) {
        this.fileExtension = fileExtension;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public Vacancy getVacancy() {
        return vacancy;
    }

    public void setVacancy(Vacancy vacancy) {
        this.vacancy = vacancy;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }
}
