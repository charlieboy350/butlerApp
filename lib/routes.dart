import 'package:buttler/components/common_info_widget.dart';
import 'package:buttler/review/reviews_screen.dart';
import 'package:buttler/screens/address/address_screen.dart';
import 'package:buttler/screens/address/my_addresses_screen.dart';
import 'package:buttler/screens/auth/login_screen.dart';
import 'package:buttler/screens/auth/otp_verification_screen.dart';
import 'package:buttler/screens/booking/booking_details_screen.dart';
import 'package:buttler/screens/cart/cart_screen.dart';
import 'package:buttler/screens/edit_profile_screen.dart';
import 'package:buttler/screens/home/bottom_bar_screen.dart';
import 'package:buttler/screens/messages/chat_message_screen.dart';
import 'package:buttler/screens/notification_screen.dart';
import 'package:buttler/screens/on_boarding/on_boarding_screen.dart';
import 'package:buttler/screens/order_processing_screen.dart';
import 'package:buttler/screens/payment/add_payment_method_screen.dart';
import 'package:buttler/screens/payment/choose_payment_method_screen.dart';
import 'package:buttler/screens/payment/payment_method_details_screen.dart';
import 'package:buttler/screens/payment/payment_method_list_screen.dart';
import 'package:buttler/screens/quick_inspection/quick_inspection_screen.dart';
import 'package:buttler/screens/select_timings_screen.dart';
import 'package:buttler/screens/service/service_list_details_screen.dart';
import 'package:buttler/screens/service/service_list_screen.dart';
import 'package:buttler/screens/support/faq_detail_screen.dart';
import 'package:buttler/screens/support/faq_screen.dart';
import 'package:buttler/screens/support/support_screen.dart';
import 'package:buttler/screens/verification/verification_user_screen.dart';
import 'package:buttler/screens/worker_profile_screen.dart';
import 'package:buttler/screens/privacy_policy_screen.dart';
import 'package:flutter/material.dart';
import 'constants/routes/routes_constants.dart';
import 'screens/quick_inspection/quick_inspection_request_screen.dart';

onGenerateRoutes(RouteSettings settings, navigatorKey) {
  switch (settings.name) {
    case RouteConstants.onboarding:
      return MaterialPageRoute(builder: (_) => OnboardingScreen());
    case RouteConstants.login:
      return MaterialPageRoute(builder: (_) => LoginScreen());
    case RouteConstants.otpVerification:
      return MaterialPageRoute(builder: (_) => OTPVerification());
    case RouteConstants.bottomBarScreen:
      return MaterialPageRoute(builder: (_) => BottomBarScreen());
    case RouteConstants.serviceListScreen:
      return MaterialPageRoute(builder: (_) => ServiceListScreen());
    case RouteConstants.serviceListDetailScreen:
      return MaterialPageRoute(builder: (_) => ServiceListDetailScreen());
    case RouteConstants.cartScreen:
      return MaterialPageRoute(builder: (_) => CartScreen());
    case RouteConstants.bookingDetailsScreen:
      return MaterialPageRoute(builder: (_) => BookingDetailsScreen());
    case RouteConstants.workerProfileScreen:
      return MaterialPageRoute(builder: (_) => WorkerProfileStateScreen());
    case RouteConstants.reviewsScreen:
      return MaterialPageRoute(
          builder: (_) => ReviewsScreen(userReview: settings.arguments));
    case RouteConstants.myAddressessScreen:
      return MaterialPageRoute(builder: (_) => MyAddressesScreen());
    case RouteConstants.paymentMethodScreen:
      return MaterialPageRoute(builder: (_) => PaymentMethodListScreen());
    case RouteConstants.paymentMethodDetailsScreen:
      return MaterialPageRoute(builder: (_) => PaymentMethodDetailsScreen());
    case RouteConstants.addPaymentMethodScreen:
      return MaterialPageRoute(builder: (_) => AddPaymentMethodScreen());
    case RouteConstants.addAddressScreen:
      return MaterialPageRoute(builder: (_) => AddAddressScreen());
    case RouteConstants.supportScreen:
      return MaterialPageRoute(builder: (_) => SupportScreen());
    case RouteConstants.faqScreen:
      return MaterialPageRoute(builder: (_) => FaqScreen());
    case RouteConstants.faqDetailScreen:
      return MaterialPageRoute(builder: (_) => FaqDetailScreen());
    case RouteConstants.verificationGuideLineScreen:
      return MaterialPageRoute(builder: (_) => CommonInfoComponent());
    case RouteConstants.verificationUserScreen:
      return MaterialPageRoute(
        builder: (_) => VerificationPicScreen(
          verifyPic: settings.arguments,
        ),
      );
    case RouteConstants.editProfileScreen:
      return MaterialPageRoute(builder: (_) => EditProfileScreen());
    case RouteConstants.choosePaymentMethodScreen:
      return MaterialPageRoute(builder: (_) => ChoosePaymentMethodScreen());
    case RouteConstants.orderProcessingScreen:
      return MaterialPageRoute(builder: (_) => OrderProcessingScreen());
    case RouteConstants.notificationScreen:
      return MaterialPageRoute(builder: (_) => NotifictionsScreen());
    case RouteConstants.chatScreen:
      return MaterialPageRoute(builder: (_) => ChatMessageScreen());
    case RouteConstants.selectTimingsScreen:
      return MaterialPageRoute(builder: (_) => SelectTimingsScreen());
    case RouteConstants.privacyPolicyScreen:
      return MaterialPageRoute(builder: (_) => PrivacyPolicyScreen());
    case RouteConstants.quickInspectionScreen:
      return MaterialPageRoute(builder: (_) => QuickInspectionScreen());
    case RouteConstants.quickInspectionRequestScreen:
      return MaterialPageRoute(builder: (_) => QuickInspectionRquestScreen());
    // case RouteConstants.tempScreen:
    //   return MaterialPageRoute(
    //       builder: (_) => TakePicturePage(camera: settings.arguments));
    default:
  }
}
