class AddressModel {
  String? addressId;
  String? addressName;
  String? addressUsersId;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  AddressModel({this.addressId, this.addressName, this.addressUsersId, this.addressCity, this.addressStreet, this.addressLat, this.addressLong});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressId = json["address_id"];
    addressName = json["address_name"];
    addressUsersId = json["address_usersId"];
    addressCity = json["address_city"];
    addressStreet = json["address_street"];
    addressLat = json["address_lat"];
    addressLong = json["address_long"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["address_id"] = addressId;
    _data["address_name"] = addressName;
    _data["address_usersId"] = addressUsersId;
    _data["address_city"] = addressCity;
    _data["address_street"] = addressStreet;
    _data["address_lat"] = addressLat;
    _data["address_long"] = addressLong;
    return _data;
  }
}