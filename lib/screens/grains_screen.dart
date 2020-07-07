import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:zoper_app/model/offers_model.dart';
import 'package:zoper_app/model/product_categories.dart';
import 'package:zoper_app/screens/grains_details_screen.dart';
import 'package:zoper_app/utilities/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:positioned_tap_detector/positioned_tap_detector.dart';

class GrainsScreen extends StatefulWidget {
  @override
  _GrainsScreenState createState() => _GrainsScreenState();
}

class _GrainsScreenState extends State<GrainsScreen> {
  OfferModel _offerModel;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('Offers').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        } else if (snapshot.data != null) {
          return StaggeredGridView.countBuilder(
            crossAxisCount: 2,
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot documentSnapshot =
                  snapshot.data.documents[index];

              _offerModel = OfferModel.fromJson(documentSnapshot.data);

              return Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: colorGridTileBG,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      right: 0,
                      bottom: 0,
                      left: 0,
                      child: GestureDetector(
                        onTap: () {
                          print(index);
                          OfferModel offerModel = OfferModel.fromJson(
                              snapshot.data.documents[index].data);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GrainsDetails(
                                        offerModel: offerModel,
                                      )));
                        },
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          padding: EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Image.network(
                                _offerModel.imageUrl,
                                width: 90.0,
                                height: 90.0,
                                fit: BoxFit.fitHeight,
                              ),
                              SizedBox(height: 10.0),
                              Text(
                                _offerModel.name,
                                textAlign: TextAlign.start,
                                style: bodyTextStyle,
                                maxLines: 2,
                              ),
                              Text(
                                'Some Description',
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black45,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      '₹${_offerModel.mrp}',
                                      textAlign: TextAlign.start,
                                      style: priceTextSmall,
                                    ),
                                  ),
                                  Text(
                                    '1kg Price',
                                    textAlign: TextAlign.end,
                                    style: unitTextSmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 25,
                      right: 0,
                      child: GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          Fluttertoast.showToast(
                            msg: 'Cart Position OK! $index',
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 1,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.deepOrangeAccent,
                          );
                        },
                        child: Container(
                          width: 40.0,
                          height: 30.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10))),
                          child: Center(
                            child: Icon(
                              Icons.add_shopping_cart,
                              color: Colors.deepOrangeAccent,
                              size: 18.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            staggeredTileBuilder: (int index) => StaggeredTile.count(
              1,
              index.isEven ? 1.4 : 1.3,
            ),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          );
        } else {
          print(snapshot.data.toString());
          return Center(
            child: Text(
              'Nothing Found!',
              style: TextStyle(
                  color: Colors.redAccent, fontWeight: FontWeight.bold),
            ),
          );
        }
      },
    );
  }
}
