import 'package:flutter/material.dart';
import 'package:admin_fashion_shop/components/CircleTabIndicator.dart';
import 'package:admin_fashion_shop/constants/constants.dart';
import 'package:admin_fashion_shop/components/chochets_list_widget.dart';
import 'package:admin_fashion_shop/utils/interface.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AssetImage productImage = AssetImage('images/bag.jpeg');
  @override
  void initState() {
    super.initState();

    getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Image(
                        image: AssetImage('images/logo-icon.png'),
                      ),
                    ),
                    SizedBox(
                      width: 120.0,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 100.0, right: 10.0),
                      child: Icon(
                        Icons.search,
                        size: 40.0,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 25.0),
                      child: InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.shopping_cart,
                          size: 40.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TabBar(
                  indicator: CircleTabIndicator(color: Colors.white, radius: 3),
                  tabs: <Widget>[
                    Tab(
                      child: Text(kAfricanWearCategoryName),
                    ),
                    Tab(
                      child: Text(kPalazzoCategoryName),
                    ),
                    Tab(
                      child: Text(kCrochetCategoryName),
                    ),
                  ]),
              Expanded(
                //crochet tab
                child: TabBarView(
                  children: <Widget>[
//  AfricanWearProductListWidget(),
//  PalazzoProductListWidget(),
                    CrochetProductListWidget(),
                    CrochetProductListWidget(),
                    CrochetProductListWidget(),
                  ],
                ),
              ),

//              Container(width: 100.0, height: 90.0, child: BottomMenuButton())
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Icon(Icons.add),
          backgroundColor: Colors.grey[500],
        ),
      ),
    );
  }
}
