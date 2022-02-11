// To parse this JSON data, do
//
//     final orders = ordersFromJson(jsonString);

import 'dart:convert';

List<Orders> ordersFromJson(String str) =>
    List<Orders>.from(json.decode(str).map((x) => Orders.fromJson(x)));

String ordersToJson(List<Orders> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Orders {
  Orders({
    required this.id,
    required this.orderSum,
    required this.qty,
    required this.status,
    required this.statusReason,
    // required this.completedAt,
    required this.cookingTime,
    required this.statusChangedAt,
    required this.comment,
    required this.statusSet,
    required this.deliveryPrice,
    required this.courierType,
    required this.deliveryIncome,
    required this.deliveryDeduction,
    this.paymentId,
    this.paymentType,
    required this.createdAt,
    this.cartId,
    required this.shopId,
    required this.courierId,
    required this.userId,
    required this.user,
    required this.shop,
    required this.products,
  });

  int id;
  int orderSum;
  int qty;
  String status;
  String statusReason;
  // DateTime completedAt;
  int cookingTime;
  DateTime statusChangedAt;
  String comment;
  dynamic statusSet;
  int deliveryPrice;
  String courierType;
  int deliveryIncome;
  int deliveryDeduction;
  dynamic paymentId;
  dynamic paymentType;
  DateTime createdAt;
  dynamic cartId;
  int shopId;
  int courierId;
  int userId;
  User user;
  Shop shop;
  List<Product> products;

  factory Orders.fromJson(Map<String, dynamic> json) => Orders(
        id: json["id"],
        orderSum: json["order_sum"],
        qty: json["qty"],
        status: json["status"],
        statusReason: json["status_reason"],
        // completedAt: DateTime.parse(json["completed_at"]),
        cookingTime: json["cooking_time"],
        statusChangedAt: DateTime.parse(json["status_changed_at"]),
        comment: json["comment"],
        statusSet: json["status_set"],
        deliveryPrice: json["delivery_price"],
        courierType: json["courier_type"],
        deliveryIncome: json["delivery_income"],
        deliveryDeduction: json["delivery_deduction"],
        paymentId: json["payment_id"],
        paymentType: json["payment_type"],
        createdAt: DateTime.parse(json["created_at"]),
        cartId: json["cart_id"],
        shopId: json["shop_id"],
        courierId: json["courier_id"],
        userId: json["user_id"],
        user: User.fromJson(json["User"]),
        shop: Shop.fromJson(json["Shop"]),
        products: List<Product>.from(
            json["Products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "order_sum": orderSum,
        "qty": qty,
        "status": status,
        "status_reason": statusReason,
        // "completed_at": completedAt.toIso8601String(),
        "cooking_time": cookingTime,
        "status_changed_at": statusChangedAt.toIso8601String(),
        "comment": comment,
        "status_set": statusSet,
        "delivery_price": deliveryPrice,
        "courier_type": courierType,
        "delivery_income": deliveryIncome,
        "delivery_deduction": deliveryDeduction,
        "payment_id": paymentId,
        "payment_type": paymentType,
        "created_at": createdAt.toIso8601String(),
        "cart_id": cartId,
        "shop_id": shopId,
        "courier_id": courierId,
        "user_id": userId,
        "User": user.toJson(),
        "Shop": shop.toJson(),
        "Products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.weight,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.shopId,
    required this.orderProduct,
  });

  int id;
  String name;
  int price;
  String description;
  int weight;
  bool isActive;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int shopId;
  OrderProduct orderProduct;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        weight: json["weight"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        shopId: json["shop_id"],
        orderProduct: OrderProduct.fromJson(json["OrderProduct"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "weight": weight,
        "is_active": isActive,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "shop_id": shopId,
        "OrderProduct": orderProduct.toJson(),
      };
}

class OrderProduct {
  OrderProduct({
    required this.orderId,
    required this.productId,
    required this.qty,
    required this.createdAt,
    required this.updatedAt,
  });

  int orderId;
  int productId;
  int qty;
  DateTime createdAt;
  DateTime updatedAt;

  factory OrderProduct.fromJson(Map<String, dynamic> json) => OrderProduct(
        orderId: json["order_id"],
        productId: json["product_id"],
        qty: json["qty"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "product_id": productId,
        "qty": qty,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Shop {
  Shop({
    required this.secret,
    required this.secretRoute,
    required this.id,
    required this.address,
    required this.addressJson,
    required this.lat,
    required this.lng,
    required this.name,
    this.workingTime,
    this.shopInfo,
    required this.cookingTime,
    required this.minimalSum,
    required this.deliveryType,
    required this.rating,
    this.info,
    required this.isActive,
    required this.isConfirmed,
    required this.isFixedPrice,
    required this.type,
    this.paymentTypes,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.terminalId,
  });

  String secret;
  String secretRoute;
  int id;
  String address;
  AddressJson addressJson;
  double lat;
  double lng;
  String name;
  dynamic workingTime;
  dynamic shopInfo;
  int? cookingTime;
  int minimalSum;
  String deliveryType;
  int rating;
  dynamic info;
  bool isActive;
  bool isConfirmed;
  bool isFixedPrice;
  String type;
  dynamic paymentTypes;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  int terminalId;

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        secret: json["secret"],
        secretRoute: json["secret_route"],
        id: json["id"],
        address: json["address"],
        addressJson: AddressJson.fromJson(json["address_json"]),
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        name: json["name"],
        workingTime: json["working_time"],
        shopInfo: json["shop_info"],
        cookingTime: json["cooking_time"],
        minimalSum: json["minimal_sum"],
        deliveryType: json["delivery_type"],
        rating: json["rating"],
        info: json["info"],
        isActive: json["is_active"],
        isConfirmed: json["is_confirmed"],
        isFixedPrice: json["is_fixed_price"],
        type: json["type"],
        paymentTypes: json["payment_types"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        terminalId: json["terminal_id"],
      );

  Map<String, dynamic> toJson() => {
        "secret": secret,
        "secret_route": secretRoute,
        "id": id,
        "address": address,
        "address_json": addressJson.toJson(),
        "lat": lat,
        "lng": lng,
        "name": name,
        "working_time": workingTime,
        "shop_info": shopInfo,
        "cooking_time": cookingTime,
        "minimal_sum": minimalSum,
        "delivery_type": deliveryType,
        "rating": rating,
        "info": info,
        "is_active": isActive,
        "is_confirmed": isConfirmed,
        "is_fixed_price": isFixedPrice,
        "type": type,
        "payment_types": paymentTypes,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "terminal_id": terminalId,
      };
}

class AddressJson {
  AddressJson({
    required this.town,
    required this.house,
    required this.street,
  });

  String town;
  String house;
  String street;

  factory AddressJson.fromJson(Map<String, dynamic> json) => AddressJson(
        town: json["town"],
        house: json["house"],
        street: json["street"],
      );

  Map<String, dynamic> toJson() => {
        "town": town,
        "house": house,
        "street": street,
      };
}

class User {
  User({
    required this.id,
    required this.phone,
    required this.name,
    required this.lng,
    required this.lat,
    required this.address,
    // required this.addressJson,
  });

  int id;
  String phone;
  String? name;
  double lng;
  double lat;
  String address;
  // Map<String, String> addressJson;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        phone: json["phone"],
        name: json["name"],
        lng: json["lng"].toDouble(),
        lat: json["lat"].toDouble(),
        address: json["address"],
        // addressJson: Map.from(json["address_json"])
        //     .map((k, v) => MapEntry<String, String>(k, v == null ? null : v)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "name": name,
        "lng": lng,
        "lat": lat,
        "address": address,
        // "address_json": Map.from(addressJson)
        //     .map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)),
      };
}
