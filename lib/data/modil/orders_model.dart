class OrdersModels {
  String? ordersId;
  String? ordersUsersid;
  String? ordersAddress;
  String? ordersType;
  String? ordersPricedelivery;
  String? ordersPrice;
  String? ordersTotalprice;
  String? ordersDatetime;
  String? ordersPayments;
  String? ordersStutes;

  OrdersModels(
      {this.ordersId,
      this.ordersUsersid,
      this.ordersAddress,
      this.ordersType,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersTotalprice,
      this.ordersDatetime,
      this.ordersPayments,
      this.ordersStutes});

  OrdersModels.fromJson(Map<String, dynamic> json) {
    ordersId = json["orders_id"];
    ordersUsersid = json["orders_usersid"];
    ordersAddress = json["orders_address"];
    ordersType = json["orders_type"];
    ordersPricedelivery = json["orders_pricedelivery"];
    ordersPrice = json["orders_price"];
    ordersTotalprice = json["orders_totalprice"];
    ordersDatetime = json["orders_datetime"];
    ordersPayments = json["orders_payments"];
    ordersStutes = json["orders_stutes"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["orders_id"] = ordersId;
    _data["orders_usersid"] = ordersUsersid;
    _data["orders_address"] = ordersAddress;
    _data["orders_type"] = ordersType;
    _data["orders_pricedelivery"] = ordersPricedelivery;
    _data["orders_price"] = ordersPrice;
    _data["orders_totalprice"] = ordersTotalprice;
    _data["orders_datetime"] = ordersDatetime;
    _data["orders_payments"] = ordersPayments;
    _data["orders_stutes"] = ordersStutes;
    return _data;
  }
}
