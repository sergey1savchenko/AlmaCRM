package com.my.alma.model;

import javax.persistence.*;
import java.util.Collection;

@Entity
@Table(name="role")
public class Role {

    @Id
    @Column(name="id")
    @GeneratedValue(strategy= GenerationType.AUTO)
    private int id;

    @Column(name="role")
    private String role;

    @OneToMany(mappedBy="role")
    private Collection<User> users;

    @OneToMany(mappedBy="role")
    private Collection<News> news;

    public Role(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Collection<User> getUsers() {
        return users;
    }

    public void setUsers(Collection<User> users) {
        this.users = users;
    }

    public Collection<News> getNews() {
        return news;
    }

    public void setNews(Collection<News> news) {
        this.news = news;
    }
}
