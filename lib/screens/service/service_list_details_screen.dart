import 'package:buttler/components/button_component.dart';
import 'package:buttler/components/common_component.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:flutter/material.dart';

class ServiceListDetailScreen extends StatefulWidget {
  @override
  _ServiceListDetailScreenState createState() =>
      _ServiceListDetailScreenState();
}

class _ServiceListDetailScreenState extends State<ServiceListDetailScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 8, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,
                color: ColorConstant.white, size: 16)),
        backgroundColor: ColorConstant.darkGreyBlue,
        title: Text('Plumber Service'),
        bottom: TabBar(
          indicatorColor: ColorConstant.pissYellow,
          isScrollable: true,
          tabs: [
            Tab(text: "Geyser"),
            Tab(text: "Pipe"),
            Tab(text: "Shower"),
            Tab(text: "Bathtub"),
            Tab(text: "Sink"),
            Tab(text: "Leakage"),
            Tab(text: "Toilet Seat"),
            Tab(text: "Geyser"),
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          buildServicesDetailListViewWidget(),
          buildServicesDetailListViewWidget(),
          buildServicesDetailListViewWidget(),
          buildServicesDetailListViewWidget(),
          buildServicesDetailListViewWidget(),
          buildServicesDetailListViewWidget(),
          buildServicesDetailListViewWidget(),
          buildServicesDetailListViewWidget(),
        ],
        controller: _tabController,
      ),
      bottomNavigationBar: 
      Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorConstant.darkGreyBlue,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: 60,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 10, 16, 8),
                child: ButtonComponent(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteConstants.cartScreen);
                  },
                  buttonText: StringConstant.continueText.toUpperCase(),
                  color: ColorConstant.pissYellow,
                  textStyle: FontStyles.fontMedium(
                      color: ColorConstant.darkGreyBlue,
                      letterSpacing: 1.3,
                      fontSize: 13.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding buildServicesDetailListViewWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return CommonComponents.buildServicesDetailListItemWidget(index);
        },
      ),
    );
  }
}
