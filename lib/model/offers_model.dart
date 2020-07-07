import 'dart:core';
import 'package:cloud_firestore/cloud_firestore.dart';

class OfferModel {
  String name;
  String imageUrl;
  String mrp;
  Timestamp timestamp;
  String zoperPrice;

  OfferModel(
      {this.name, this.imageUrl, this.mrp, this.timestamp, this.zoperPrice});

  Map<String, dynamic> toJson() => {
        'name': name,
        'imageUrl': imageUrl,
        'mrp': mrp,
        'timestamp': timestamp,
        'zoperPrice': zoperPrice,
      };

  OfferModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
    mrp = json['mrp'];
    timestamp = json['timestamp'];
    zoperPrice = json['zoperPrice'];
  }
}
