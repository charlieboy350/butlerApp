import 'package:buttler/constants/assets/assets_constants.dart';
import 'package:buttler/constants/colors/colors_constants.dart';
import 'package:buttler/constants/routes/routes_constants.dart';
import 'package:buttler/constants/strings/string_constants.dart';

class JSON {
  static const profile = [
    {
      "name": StringConstant.quickInspection,
      "iconLeading": AssetConstant.profileReview,
      "iconTrailing": "",
      "navigation": RouteConstants.quickInspectionScreen,
      "Action": ""
    },
    {
      "name": StringConstant.reviews,
      "iconLeading": AssetConstant.profileReview,
      "iconTrailing": "",
      "navigation": RouteConstants.reviewsScreen,
      "Action": ""
    },
    {
      "name": StringConstant.myAddresses,
      "iconLeading": AssetConstant.profileLoc,
      "iconTrailing": "",
      "navigation": RouteConstants.myAddressessScreen,
      "Action": ""
    },
    {
      "name": StringConstant.paymentMethod,
      "iconLeading": AssetConstant.profilePayment,
      "iconTrailing": "",
      "navigation": RouteConstants.paymentMethodScreen,
      "Action": ""
    },
    {
      "name": StringConstant.verifyMyIdentity,
      "iconLeading": AssetConstant.profileVerify,
      "iconTrailing": "",
      "navigation": RouteConstants.verificationGuideLineScreen,
    },
    {
      "name": StringConstant.support,
      "iconLeading": AssetConstant.profileSupport,
      "iconTrailing": "",
      "navigation": RouteConstants.supportScreen,
      "Action": ""
    },
  ];

  static const support = [
    {
      "name": StringConstant.liveChat,
      "iconLeading": AssetConstant.chat,
      "iconTrailing": "",
      "navigation": RouteConstants.chatScreen,
      "Action": ""
    },
    {
      "name": StringConstant.emailUs,
      "iconLeading": null,
      "iconTrailing": "",
      "navigation": RouteConstants.myAddressessScreen,
      "Action": ""
    },
    {
      "name": StringConstant.callUs,
      "iconLeading": AssetConstant.call,
      "iconTrailing": "",
      "navigation": RouteConstants.paymentMethodScreen,
      "Action": ""
    },
    {
      "name": StringConstant.faq,
      "iconLeading": AssetConstant.supportFaq,
      "iconTrailing": "",
      "navigation": RouteConstants.faqScreen,
      "Action": ""
    },
  ];

  static var onboarding = [
    {
      "bg_color": ColorConstant.beige,
      "heading_color": ColorConstant.darkGreyBlue,
      "sub_heading_color": ColorConstant.charcoal,
      "disable_dots_color": ColorConstant.charcoal.withOpacity(0.3),
      "text_color": ColorConstant.charcoal,
      "button_color": ColorConstant.darkGreyBlue,
      "button_text_color": ColorConstant.white,
      "text": "With Butlers, Everyday tasks are now easy",
      "sub_heading_text": "Book plumber, electrician, gardener, cleaner or etc straight from your phone.",
      "image": AssetConstant.onboardingOne,
    },
    {
      "bg_color": ColorConstant.paleGrey,
      "heading_color": ColorConstant.darkGreyBlue,
      "sub_heading_color": ColorConstant.charcoal,
      "disable_dots_color": ColorConstant.charcoal.withOpacity(0.3),
      "text_color": ColorConstant.charcoal,
      "button_color": ColorConstant.darkGreyBlue,
      "button_text_color": ColorConstant.white,
      "text": "Thousand of skilled workers on your finger tips",
      "sub_heading_text": "Butlers will facilitate you with its wide pool of skilled workers for your everyday task.",
      "image": AssetConstant.onboardingTwo
    },
    {
      "bg_color": ColorConstant.beige,
      "heading_color": ColorConstant.darkGreyBlue,
      "sub_heading_color": ColorConstant.charcoal,
      "disable_dots_color": ColorConstant.charcoal.withOpacity(0.3),
      "text_color": ColorConstant.charcoal,
      "button_color": ColorConstant.darkGreyBlue,
      "button_text_color": ColorConstant.white,
      "text": "Get all the work done at your doorstep",
      "sub_heading_text": "We are here to facilitate all kinds of household works right on your doorsteps.",
      "image": AssetConstant.onboardingThree
    },
  ];
}
