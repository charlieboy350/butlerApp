import 'package:buttler/providers/on_boarding_provider.dart';
import 'package:buttler/providers/place_picker_provider.dart';
import 'package:provider/provider.dart';

import 'internet/internet_connectivity.dart';

final providersList = [
  ChangeNotifierProvider(
    create: (_) => OnBoardingProvider(),
  ),
  ChangeNotifierProvider(
    create: (_) => PlacePickerProvider(),
  ),
   StreamProvider<ConnectivityStatus>.value(
    value: ConnectivityServices().connectionStatusController.stream,
  ),
];
