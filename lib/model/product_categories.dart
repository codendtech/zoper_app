import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategories {
  int dbCount;
  String imageUrl;
  String name;
  Timestamp timestamp;

  ProductCategories({this.dbCount, this.imageUrl, this.name, this.timestamp});

  Map<String, dynamic> toJson() => {
        'dbCount': dbCount,
        'imageUrl': imageUrl,
        'name': name,
        'timestamp': timestamp,
      };

  ProductCategories.fromJson(Map<String, dynamic> json) {
    dbCount = json['dbCount'];
    imageUrl = json['imageUrl'];
    name = json['name'];
    timestamp = json['timestamp'];
  }
}
