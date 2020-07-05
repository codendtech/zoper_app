import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zoper_app/utilities/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:zoper_app/screens/grains_screen.dart' as grainsScreen;
import 'package:zoper_app/screens/veg_screen.dart' as veg;
import 'package:zoper_app/screens/beverages_screen.dart' as bev;
import 'package:zoper_app/screens/personal_care_screen.dart' as personal;
import 'package:zoper_app/screens/stationary_screen.dart' as stationery;
import 'package:zoper_app/screens/cleaning_screen.dart' as cleaning;

class HomeScreen extends StatefulWidget {
  static final String id = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _currentIndex = 0;
  List<Color> _colors = [colorButtonThemeStart, colorButtonThemeEnd];
  List<double> _stops = [0.0, 0.7];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 0, vsync: this, length: 6);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TopBarHome(colors: _colors, stops: _stops),
                  SearchBarHome(),
                  TabBarHome(
                    tickerProvider: this,
                    tabController: _tabController,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    grainsScreen.GrainsScreen(),
                    veg.VegScreen(),
                    bev.BeveragesScreen(),
                    personal.PersonalCareScreen(),
                    stationery.StationaryScreen(),
                    cleaning.CleaningScreen(),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.green,
          unselectedItemColor: Colors.white60,
          selectedItemColor: Colors.white,
          iconSize: 25.0,
          items: [
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.offline_bolt),
              title: Text('Offers'),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.gift),
              title: Text('Deals'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text('Cart'),
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.userAlt),
              title: Text('Profile'),
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class TopBarHome extends StatelessWidget {
  const TopBarHome({
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
        children: [
          Expanded(
            child: Text(
              "Zoper Store",
              style: largeTitleTextStyle,
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
          Container(
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
        ],
      ),
    );
  }
}

class SearchBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: TextField(
        style: textFieldTextStyle,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30.0),
              ),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.all(10.0),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black87,
            ),
            filled: true,
            fillColor: Colors.grey[100],
            hintText: 'Rice, vegetables, eggs, milk'),
      ),
    );
  }
}

class TabBarHome extends StatelessWidget {
  final TickerProvider tickerProvider;
  final TabController tabController;

  TabBarHome({this.tickerProvider, this.tabController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: TabBar(
        controller: tabController,
        isScrollable: true,
        unselectedLabelColor: Colors.black45,
        labelColor: colorBlack,
        labelStyle: tabBarTitleStyle,
        unselectedLabelStyle: TextStyle(
          color: Colors.black45,
          fontSize: 15.0,
          fontFamily: 'ProductSans',
        ),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(width: 3.0, color: Colors.deepOrange),
          insets: EdgeInsets.symmetric(horizontal: 50.0),
        ),
        tabs: [
          Tab(
            child: Text(
              'Food Grains',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Tab(
            child: Text(
              'Vegetables',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Tab(
            child: Text(
              'Beverages',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Tab(
            child: Text(
              'Personal Care',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Tab(
            child: Text(
              'Stationery',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Tab(
            child: Text(
              'Cleaning',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
