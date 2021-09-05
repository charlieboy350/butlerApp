import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';
import 'package:buttler/constants/styles/font_styles_constants.dart';
import 'package:buttler/screens/booking/booking_screen.dart';
import 'package:buttler/screens/home/home_screen.dart';
import 'package:buttler/screens/home/message_screen.dart';
import 'package:buttler/screens/home/more_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomBarScreen extends StatefulWidget {
  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    BookingScreen(),
    MessageScreen(),
    MoreScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      changeTab(index, context);
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> _willPopCallback() async {
      //Todo: check stack count

      if (_selectedIndex != 0) {
        setState(() {
          changeTab(0, context);
        });
        return false;
      } else {
        return true;
      }
    }

    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetConstant.home),
              activeIcon: SvgPicture.asset(AssetConstant.homeSelected),
              label: StringConstant.home,
              
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetConstant.booking),
              activeIcon: SvgPicture.asset(AssetConstant.bookingSelected),
              label: StringConstant.bookings,
               
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetConstant.message),
              activeIcon: SvgPicture.asset(AssetConstant.messageSelected),
              label: StringConstant.messages,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(AssetConstant.more),
              activeIcon: SvgPicture.asset(AssetConstant.moreSelected),
              label: StringConstant.more,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: ColorConstant.darkGreyBlue,
          selectedLabelStyle: FontStyles.fontMedium(color: ColorConstant.kellyGreen,bold: true,fontSize: 12),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }

  changeTab(int index, context) {
    _selectedIndex = index;
    // var provider = Provider.of<SearchProvider>(context, listen: false);
    // var authProvider = Provider.of<AuthProvider>(context, listen: false);
    // provider.searchInputFocus.unfocus();
    // provider.setSearchScreen(false);
    // if (provider.overlayEntry != null) {
    //   provider.overlayEntry.remove();
    //   provider.overlayEntry = null;
    //   provider.searchController.text = "";
    // }
    // if (!authProvider.userModel.loggedIn) {
    //   if (index == 4) {
    //     authProvider.navigateToScreen = RouteConstants.profileMenu;
    //     Navigator.pushNamed(context, RouteConstants.pleaseSignInSignup);
    //   } else {
    //     _selectedIndex = index;
    //   }
    // } else {
    //   _selectedIndex = index;
    // }
  }
}
