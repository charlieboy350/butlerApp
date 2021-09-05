import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/provider_initialize_list.dart';
import 'package:buttler/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'constants/routes/routes_constants.dart';
import 'internet/internet_connectivity.dart';

void main() {
  //if you lock app on portrait mode you have to use this line
    WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor:
        ColorConstant.darkGreyBlue, // navigation bar color
    statusBarColor: ColorConstant.darkGreyBlue, // status bar color
  ));
  //lock app on portrait mode
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providersList,
      child: Consumer<ConnectivityStatus>(
          builder: (context, consumer, childWidget) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          title: 'Buttler',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: (RouteSettings settings) {
            return onGenerateRoutes(settings, navigatorKey);
          },
          debugShowCheckedModeBanner: false,
          initialRoute: RouteConstants.onboarding,
        );
      }),
    );
  }
}
