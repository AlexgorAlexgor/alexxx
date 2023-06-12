package com.startainstitute.oop4.orders;

public interface Order {
  //  Создайте интерфейс "Order" с методами "getStatus()", "getPaymentType()" и getPrice(),

     OrderStatus getStatus();
     PaymentType getPaymentType() ;
     int  getPrice();

}
