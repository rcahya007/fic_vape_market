// ignore_for_file: public_member_api_docs, sort_constructors_first
// To parse this JSON data, do
//
//     final listProductResponseModel = listProductResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/foundation.dart';

class ListProductResponseModel {
  List<Product>? data;
  Meta? meta;

  ListProductResponseModel({
    this.data,
    this.meta,
  });

  factory ListProductResponseModel.fromRawJson(String str) =>
      ListProductResponseModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ListProductResponseModel.fromJson(Map<String, dynamic> json) =>
      ListProductResponseModel(
        data: json["data"] == null
            ? []
            : List<Product>.from(json["data"]!.map((x) => Product.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "meta": meta?.toJson(),
      };

  @override
  bool operator ==(covariant ListProductResponseModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.data, data) && other.meta == meta;
  }

  @override
  int get hashCode => data.hashCode ^ meta.hashCode;
}

class Product {
  int? id;
  Attributes? attributes;

  Product({
    this.id,
    this.attributes,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        attributes: json["attributes"] == null
            ? null
            : Attributes.fromJson(json["attributes"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "attributes": attributes?.toJson(),
      };

  @override
  bool operator ==(covariant Product other) {
    if (identical(this, other)) return true;

    return other.id == id && other.attributes == attributes;
  }

  @override
  int get hashCode => id.hashCode ^ attributes.hashCode;
}

class Attributes {
  String? productName;
  String? productDescription;
  bool? isSold;
  int? productPrice;
  DateTime? productRelease;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? publishedAt;
  String? imageUrl;

  Attributes({
    this.productName,
    this.productDescription,
    this.isSold,
    this.productPrice,
    this.productRelease,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.imageUrl,
  });

  factory Attributes.fromRawJson(String str) =>
      Attributes.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        productName: json["product_name"],
        productDescription: json["product_description"],
        isSold: json["is_sold"],
        productPrice: json["product_price"],
        productRelease: json["product_release"] == null
            ? null
            : DateTime.parse(json["product_release"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "product_name": productName,
        "product_description": productDescription,
        "is_sold": isSold,
        "product_price": productPrice,
        "product_release":
            "${productRelease!.year.toString().padLeft(4, '0')}-${productRelease!.month.toString().padLeft(2, '0')}-${productRelease!.day.toString().padLeft(2, '0')}",
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "publishedAt": publishedAt?.toIso8601String(),
        "image_url": imageUrl,
      };

  @override
  bool operator ==(covariant Attributes other) {
    if (identical(this, other)) return true;

    return other.productName == productName &&
        other.productDescription == productDescription &&
        other.isSold == isSold &&
        other.productPrice == productPrice &&
        other.productRelease == productRelease &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt &&
        other.publishedAt == publishedAt &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return productName.hashCode ^
        productDescription.hashCode ^
        isSold.hashCode ^
        productPrice.hashCode ^
        productRelease.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        publishedAt.hashCode ^
        imageUrl.hashCode;
  }
}

class Meta {
  Pagination? pagination;

  Meta({
    this.pagination,
  });

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        pagination: json["pagination"] == null
            ? null
            : Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "pagination": pagination?.toJson(),
      };
}

class Pagination {
  int? page;
  int? pageSize;
  int? pageCount;
  int? total;

  Pagination({
    this.page,
    this.pageSize,
    this.pageCount,
    this.total,
  });

  factory Pagination.fromRawJson(String str) =>
      Pagination.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        page: json["page"],
        pageSize: json["pageSize"],
        pageCount: json["pageCount"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "pageSize": pageSize,
        "pageCount": pageCount,
        "total": total,
      };
}
