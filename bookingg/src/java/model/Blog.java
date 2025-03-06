/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.*;

/**
 *
 * @author ADMIN
 */
public class Blog {

    private int id;
    private String title;
    private String content;
    private String brief;
    private Employee createdby;
    private Employee updatedby;
    private Date createdtime;
    private Date updatedtime;
    private boolean status;
    private String image;

    public Blog() {
    }

    public Blog(int id, String title, String content, String brief, Employee createdby, Employee updatedby, Date createdtime, Date updatedtime, boolean status, String image) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.brief = brief;
        this.createdby = createdby;
        this.updatedby = updatedby;
        this.createdtime = createdtime;
        this.updatedtime = updatedtime;
        this.status = status;
        this.image = image;
    }

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

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public Employee getCreatedby() {
        return createdby;
    }

    public void setCreatedby(Employee createdby) {
        this.createdby = createdby;
    }

    public Employee getUpdatedby() {
        return updatedby;
    }

    public void setUpdatedby(Employee updatedby) {
        this.updatedby = updatedby;
    }

    public Date getCreatedtime() {
        return createdtime;
    }

    public void setCreatedtime(Date createdtime) {
        this.createdtime = createdtime;
    }

    public Date getUpdatedtime() {
        return updatedtime;
    }

    public void setUpdatedtime(Date updatedtime) {
        this.updatedtime = updatedtime;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

   
}
