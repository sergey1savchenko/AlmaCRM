package com.my.alma.model;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name="questionFromStudent")
public class QuestionFromStudent {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

    @Column(name="text")
    private String text;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="studentId", nullable=false)
    private Student student;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="statusId", nullable=false)
    private Status status;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="agentId", nullable=false)
    private Agent agent;

    public QuestionFromStudent(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
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

    public Agent getAgent() { return agent; }

    public void setAgent(Agent agent) { this.agent = agent; }

}
