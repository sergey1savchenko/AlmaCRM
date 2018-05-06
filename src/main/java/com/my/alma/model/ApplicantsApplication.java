package com.my.alma.model;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name="applicantsApplication")
public class ApplicantsApplication {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

    @Column(name="title")
    private String title;

    @Column(name="text")
    private String text;

    @Column(name="authorName")
    private String authorName;

    @Column(name="email")
    private String email;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="facultyId", nullable=false)
    private Faculty faculty;

    public ApplicantsApplication(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Faculty getFaculty() {
        return faculty;
    }

    public void setFaculty(Faculty faculty) {
        this.faculty = faculty;
    }
}
