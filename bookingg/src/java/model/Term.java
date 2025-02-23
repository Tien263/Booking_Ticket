/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Quang Anh
 */
public class Term {

    private Integer id;
    private String title;
    private String content;

    // Constructor không tham số (dùng khi lấy dữ liệu từ form)
    public Term() {
    }

    // Constructor đầy đủ tham số (dùng khi lấy từ database)
    public Term(int id, String title, String content) {
        this.id = id;
        this.title = title;
        this.content = content;
    }

    // Getter và Setter
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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
}
