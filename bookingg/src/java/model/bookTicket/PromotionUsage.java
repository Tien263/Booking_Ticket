/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.bookTicket;


import java.util.Date;

public class PromotionUsage {
    private int id;
    private int cId;
    private Integer pbcId;
    private Integer pbdId;
    private Integer pbpId;
    private Date usageDate;

    public PromotionUsage() {
    }

    public PromotionUsage(int id, int cId, Integer pbcId, Integer pbdId, Integer pbpId, Date usageDate) {
        this.id = id;
        this.cId = cId;
        this.pbcId = pbcId;
        this.pbdId = pbdId;
        this.pbpId = pbpId;
        this.usageDate = usageDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCId() {
        return cId;
    }

    public void setCId(int cId) {
        this.cId = cId;
    }

    public Integer getPbcId() {
        return pbcId;
    }

    public void setPbcId(Integer pbcId) {
        this.pbcId = pbcId;
    }

    public Integer getPbdId() {
        return pbdId;
    }

    public void setPbdId(Integer pbdId) {
        this.pbdId = pbdId;
    }

    public Integer getPbpId() {
        return pbpId;
    }

    public void setPbpId(Integer pbpId) {
        this.pbpId = pbpId;
    }

    public Date getUsageDate() {
        return usageDate;
    }

    public void setUsageDate(Date usageDate) {
        this.usageDate = usageDate;
    }
}
