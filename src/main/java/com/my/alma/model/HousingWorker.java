package com.my.alma.model;

import javax.persistence.*;
import java.util.Objects;

@Entity
@Table(name="housingWorker")
public class HousingWorker {

    @Id()
    @Column(name="id")
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;

    @ManyToOne
    @JoinColumn(name="userId", nullable=false)
    private User user;

    public HousingWorker(){}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
