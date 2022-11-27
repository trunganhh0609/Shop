package com.project.qlrl.models;

public class Order {
    long orderId;
    long userId;
    String address;
    long promotionId;
    String note;
    String receiverName;
    String receiverPhone;

    public long getOrderId() {
        return orderId;
    }

    public Order() {
    }

    public void setOrderId(long orderId) {
        this.orderId = orderId;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public long getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(long promotionId) {
        this.promotionId = promotionId;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getReceiverName() {
        return receiverName;
    }

    public void setReceiverName(String receiverName) {
        this.receiverName = receiverName;
    }

    public String getReceiverPhone() {
        return receiverPhone;
    }

    public void setReceiverPhone(String receiverPhone) {
        this.receiverPhone = receiverPhone;
    }

    public Order(long orderId, long userId, String address, long promotionId, String note, String receiverName, String receiverPhone) {
        this.orderId = orderId;
        this.userId = userId;
        this.address = address;
        this.promotionId = promotionId;
        this.note = note;
        this.receiverName = receiverName;
        this.receiverPhone = receiverPhone;
    }
}
