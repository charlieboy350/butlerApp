import 'package:buttler/components/review/review_star.dart';
import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/review/reviews_screen.dart';
import 'package:buttler/ui_utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WorkerProfileStateScreen extends StatefulWidget {
  @override
  _WorkerProfileStateScreenState createState() =>
      _WorkerProfileStateScreenState();
}

class _WorkerProfileStateScreenState extends State<WorkerProfileStateScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorConstant.lightGrey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(
            SizeConfig.screenWidth / 2), // here the desired height
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(50),
            ),
          ),
          flexibleSpace: _reviewToolbar(),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios,
                color: ColorConstant.white, size: 16),
          ),
          backgroundColor: ColorConstant.darkGreyBlue,
          // title: Padding(
          //   padding: const EdgeInsets.only(
          //     top: 150,
          //     left: 0,
          //     right: 0,
          //     bottom: 0,
          //   ),
          //   child: Text('Plumber '),
          // ),

          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                indicatorColor: ColorConstant.pissYellow,
                isScrollable: true,
                tabs: [
                  Tab(text: StringConstant.about),
                  Tab(text: StringConstant.reviews),
                ],
                controller: _tabController,
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          _buildAboutWidget(),
          ReviewsScreen(
            userReview: false,
          ),
        ],
        controller: _tabController,
      ),
    );
  }

  _reviewToolbar() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          fit: FlexFit.tight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 48),
              Container(
                height: SizeConfig.screenWidth / 5,
                width: SizeConfig.screenWidth / 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  child: Image.asset(
                    AssetConstant.profilePlaceHolder,
                    width: 20,
                    height: 20,
                  ),
                ),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        'Taha Irshad',
                        style: FontStyles.fontMedium(
                            color: ColorConstant.silver, fontSize: 16.0),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: Center(
                          child: InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorConstant.kellyGreen,
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.done,
                                  size: 12,
                                  color: ColorConstant.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 6),
                  Text(
                    StringConstant.memberSince,
                    style: FontStyles.fontLight(
                        color: ColorConstant.paleGrey, fontSize: 12),
                  ),
                  SizedBox(height: 8),
                  ReviewStar(
                    reviewText: true,
                    reviewStar: 3,
                    reviewCount: 5,
                    reviewTextColor: ColorConstant.white,
                    iconSize: 16,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  //About
  _buildAboutWidgetItem({
    String icon,
    String title,
    String subTitle,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Container(
        width: SizeConfig.screenWidth,
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(icon, height: 18, color: ColorConstant.silver),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: FontStyles.fontLight(
                          color: ColorConstant.steel, fontSize: 10),
                    ),
                    Text(
                      subTitle,
                      style: FontStyles.fontRegular(
                          color: ColorConstant.darkGreyBlue,
                          fontSize: 13,
                          bold: true),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              height: 0,
              thickness: 0.3,
              color: ColorConstant.warmGreyTwo,
            ),
          ],
        ),
      ),
    );
  }

  _buildAboutWidget() {
    return Column(
      children: [
        _buildAboutWidgetItem(
            icon: AssetConstant.starDisable,
            title: "Rated 5",
            subTitle: "11 Reviews"),
        _buildAboutWidgetItem(
            icon: AssetConstant.numberBookings,
            title: StringConstant.numberOfBookings,
            subTitle: "43"),
        _buildAboutWidgetItem(
            icon: AssetConstant.memberSince,
            title: StringConstant.memberSince,
            subTitle: StringConstant.rawDate)
      ],
    );
  }

  //Reviews
  SingleChildScrollView _buildReviewWidget() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Container(
        width: SizeConfig.screenWidth,
        height: SizeConfig.screenHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "11 Reviews",
              style: FontStyles.fontRegular(
                  color: ColorConstant.darkGreyBlue, fontSize: 13, bold: true),
            ),
            Text(
              StringConstant.rawOutOf,
              style: FontStyles.fontLight(
                  color: ColorConstant.steel, fontSize: 10),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              height: 0,
              thickness: 0.3,
              color: ColorConstant.warmGreyTwo,
            ),
          ],
        ),
      ),
    );
  }
}
