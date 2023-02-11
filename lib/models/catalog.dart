// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CatalogModel {
   static final catModel = CatalogModel._internal();
  CatalogModel._internal();

  factory CatalogModel() => catModel;
  static List<Item> items = [];

  getById(int id) {}
  //= [
  //   // Item(
  //   //   id: 1,
  //   //   name: "iPhone 12 Pro",
  //   //   desc: "Apple iPhone 12th generation",
  //   //   price: 999,
  //   //   color: "#33505a",
  //   //   image:
  //   //       "https://www.91-img.com/gallery_images_uploads/0/0/006f0e18ed68367a72fda211640be822ebc621f2.JPG?tr=h-550,w-0,c-at_max",
  //   // )
  // ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image);

//we can do below work by ctrl+shift+p and then dart data class generator
  // factory Item.fromMap(Map<String, dynamic> map) {
  //   return Item(
  //     id: map["id"],
  //     name: map["name"],
  //     desc: map["desc"],
  //     price: map["price"],
  //     color: map["color"],
  //     image: map["image"],
  //   );
  // }

  // toMap() => {
  //       "id": id,
  //       "name": name,
  //       "desc": desc,
  //       "price": price,
  //       "color": color,
  //       "image": image,
  //     };

  Item copyWith({
    int? id,
    String? name,
    String? desc,
    num? price,
    String? color,
    String? image,
  }) {
    return Item(
      id ?? this.id,
      name ?? this.name,
      desc ?? this.desc,
      price ?? this.price,
      color ?? this.color,
      image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['id'] as int,
      map['name'] as String,
      map['desc'] as String,
      map['price'] as num,
      map['color'] as String,
      map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(id: $id, name: $name, desc: $desc, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(covariant Item other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
