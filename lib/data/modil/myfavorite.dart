class FavoriteModel {
  String? favoriteId;
  String? favoriteUsresid;
  String? favoriteItemsid;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? cateId;

  FavoriteModel(
      {this.favoriteId,
      this.favoriteUsresid,
      this.favoriteItemsid,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsCount,
      this.itemsActive,
      this.itemsPrice,
      this.itemsDiscount,
      this.itemsDate,
      this.cateId});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json["favorite_id"];
    favoriteUsresid = json["favorite_usresid"];
    favoriteItemsid = json["favorite_itemsid"];
    itemsId = json["items_id"];
    itemsName = json["items_name"];
    itemsNameAr = json["items_name_ar"];
    itemsDesc = json["items_desc"];
    itemsDescAr = json["items_desc_ar"];
    itemsImage = json["items_image"];
    itemsCount = json["items_count"];
    itemsActive = json["items_active"];
    itemsPrice = json["items_price"];
    itemsDiscount = json["items_discount"];
    itemsDate = json["items_date"];
    cateId = json["cate_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["favorite_id"] = favoriteId;
    _data["favorite_usresid"] = favoriteUsresid;
    _data["favorite_itemsid"] = favoriteItemsid;
    _data["items_id"] = itemsId;
    _data["items_name"] = itemsName;
    _data["items_name_ar"] = itemsNameAr;
    _data["items_desc"] = itemsDesc;
    _data["items_desc_ar"] = itemsDescAr;
    _data["items_image"] = itemsImage;
    _data["items_count"] = itemsCount;
    _data["items_active"] = itemsActive;
    _data["items_price"] = itemsPrice;
    _data["items_discount"] = itemsDiscount;
    _data["items_date"] = itemsDate;
    _data["cate_id"] = cateId;
    return _data;
  }
}
