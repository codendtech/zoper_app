import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoper_app/model/offers_model.dart';
import 'package:zoper_app/utilities/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:zoper_app/model/product_categories.dart';

class GrainsDetails extends StatefulWidget {
  final OfferModel offerModel;
  GrainsDetails({@required this.offerModel});

  @override
  _GrainsDetailsState createState() => _GrainsDetailsState();
}

class _GrainsDetailsState extends State<GrainsDetails> {
  List<Color> _colors = [colorButtonThemeStart, colorButtonThemeEnd];
  List<double> _stops = [0.0, 0.7];

  OfferModel _offerModel;

  @override
  void initState() {
    super.initState();
    _offerModel = widget.offerModel;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  TopBarGrainsDetails(
                    colors: _colors,
                    stops: _stops,
                  ),
                  SizedBox(height: 10.0),
                  GrainsProductDetails(offerModel: _offerModel)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TopBarGrainsDetails extends StatelessWidget {
  final List<Color> colors;
  final List<double> stops;

  TopBarGrainsDetails({this.stops, this.colors});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 0,
            child: Container(
              child: Icon(
                Icons.notifications_none,
                color: Colors.white,
              ),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                  colors: colors,
                  stops: stops,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 5.0),
                    blurRadius: 4.0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GrainsProductDetails extends StatelessWidget {
  final OfferModel offerModel;
  GrainsProductDetails({@required this.offerModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          offerModel.name,
          style: largeTitleTextStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5.0),
        Text(
          'Product Short Description',
          style: bodyTextStyleFaded,
        ),
        SizedBox(height: 5.0),
        RatingBar(
          itemSize: 20.0,
          initialRating: 4.5,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.deepOrangeAccent,
          ),
          onRatingUpdate: (rating) {
            print(rating);
            //TODO
          },
        ),
        SizedBox(height: 15.0),
        Image.network(
          offerModel.imageUrl,
          width: MediaQuery.of(context).size.width,
          height: 300.0,
          fit: BoxFit.contain,
        )
      ],
    );
  }
}
