import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zoper_app/utilities/constants.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class GrainsDetails extends StatefulWidget {
  @override
  _GrainsDetailsState createState() => _GrainsDetailsState();
}

class _GrainsDetailsState extends State<GrainsDetails> {
  List<Color> _colors = [colorButtonThemeStart, colorButtonThemeEnd];

  List<double> _stops = [0.0, 0.7];

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
                  GrainsProductDetails()
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
  const TopBarGrainsDetails({
    Key key,
    @required List<Color> colors,
    @required List<double> stops,
  })  : _colors = colors,
        _stops = stops,
        super(key: key);

  final List<Color> _colors;
  final List<double> _stops;

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
                  colors: _colors,
                  stops: _stops,
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Product Details',
          style: largeTitleTextStyle,
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
        SizedBox(height: 5.0),
        //Image.network(src)
      ],
    );
  }
}
