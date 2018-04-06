package com.my.alma.model;

import javax.persistence.*;

@Entity
@Table(name="errorReport")
public class ErrorReport {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

    @Column(name="text")
    private String text;

    @Column(name="authorName")
    private String authorName;

    @Column(name="email")
    private String email;

    public ErrorReport(){}

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
}
