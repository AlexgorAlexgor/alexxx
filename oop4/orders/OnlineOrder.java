package com.startainstitute.oop4.orders;

public class OnlineOrder implements Order {
    OrderStatus orderStatus ;
    PaymentType paymentType;
    int price;

    public OnlineOrder(OrderStatus orderStatus, PaymentType paymentType,int price) {
        this.paymentType = paymentType;
        this.orderStatus = orderStatus;
        this.price=price;
    }


    @Override
    public OrderStatus getStatus() {

        return orderStatus;
    }

    @Override
    public PaymentType getPaymentType() {
        return paymentType;
    }

    @Override
    public int getPrice() {
        return price;
    }
}
