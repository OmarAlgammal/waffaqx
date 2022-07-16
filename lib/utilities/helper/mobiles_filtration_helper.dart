import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:wafaq_x/models/mobile_model/mobile_model.dart';
import 'package:wafaq_x/models/requiredMobileModel.dart';

import '../constants/constantsColors.dart';
import '../constants/texts/texts.dart';


class MobilesFiltrationHelper {
  final double biggestPossibleDifferenceBetweenDisplaysInScreens = .1;
  final double biggestPossibleDifferenceBetweenDisplaysInGlass = .03;

  List<MobileWithThemeModel> getSearchResultWithTheme(
      {required List<MobileWithThemeModel> mobilesWithTheme,
      required String searchText}) {
    List<MobileWithThemeModel> filteredList = [];
    for (int i = 0; i < mobilesWithTheme.length; i++) {
      MobileModel mobile = mobilesWithTheme[i].mobileModel;
      String mobileWithBrandName =
          '${mobile.brandName.toLowerCase()} ${mobile.mobileName.toLowerCase()}';
      if (mobileWithBrandName.contains(searchText.toLowerCase())) {
        filteredList.add(mobilesWithTheme[i]);
      }
    }
    return filteredList;
  }


  List<MobileWithThemeModel> getMobilesArrangementWithTheme(
      List<dynamic> mobiles) {

    List<MobileModel> myMobiles = [];
    if (mobiles is List<MobileWithThemeModel>){
      for (final mobile in mobiles){
        myMobiles.add(mobile.mobileModel);
      }
      mobiles = myMobiles;
    }

    List<MobileWithThemeModel> list = [];
    for (int i = 0; i < brandsNamesTextsList.length; i++) {
      String requiredBrandName = brandsNamesTextsList[i];
      for (MobileModel mobile in mobiles) {
        String comingBrandName = mobile.brandName;
        if (requiredBrandName == comingBrandName) {
          list.add(getMobileWithTheme(mobile));
        }
      }
    }

    return list;
  }

  List<MobileWithThemeModel> getMobilesWithTheme(
      {required List<MobileModel> mobiles}) {
    List<MobileWithThemeModel> myList = [];
    for (MobileModel mobile in mobiles) {
      myList.add(getMobileWithTheme(mobile));
    }
    return myList;
  }

  MobileWithThemeModel getMobileWithTheme(MobileModel mobile) {
    switch (mobile.brandName.toLowerCase()) {
      case 'apple':
        return MobileWithThemeModel(
            mobileModel: mobile,
            brandLogo: appleLogoText,
            brandColor: appleColor);
      case 'samsung':
        return MobileWithThemeModel(
            mobileModel: mobile,
            brandLogo: samsungLogoText,
            brandColor: samsungColor);
      case 'huawei':
        return MobileWithThemeModel(
            mobileModel: mobile,
            brandLogo: huaweiLogoText,
            brandColor: huaweiColor);
      case 'oppo':
        return MobileWithThemeModel(
            mobileModel: mobile,
            brandLogo: oppoLogoText,
            brandColor: oppoColor);
      case 'honor':
        return MobileWithThemeModel(
            mobileModel: mobile,
            brandLogo: honorLogoText,
            brandColor: honorColor);
      case 'vivo':
        return MobileWithThemeModel(
            mobileModel: mobile,
            brandLogo: vivoLogoText,
            brandColor: vivoColor);
      case 'xiaomi':
        return MobileWithThemeModel(
            mobileModel: mobile,
            brandLogo: xiaomiLogoText,
            brandColor: xiaomiColor);
      case 'realme':
        return MobileWithThemeModel(
            mobileModel: mobile,
            brandLogo: realmeLogoText,
            brandColor: realmeColor);
      case 'infinix':
        return MobileWithThemeModel(
            mobileModel: mobile,
            brandLogo: infinixLogoText,
            brandColor: infinixColor);
    }
    return MobileWithThemeModel(
        mobileModel: mobile, brandLogo: nokiaLogoText, brandColor: nokiaColor);
  }

  List<MobileWithThemeModel> getBrandMobilesWithTheme(
      {required List<MobileModel> mobiles, required String brandName}) {
    List<MobileWithThemeModel> list = [];
    List<MobileModel> brandMobiles =
        getBrandMobiles(mobiles: mobiles, brandName: brandName);
    for (MobileModel mobile in brandMobiles) {
      list.add(getMobileWithTheme(mobile));
    }
    return list;
  }

  List<MobileModel> getBrandMobiles(
      {required List<MobileModel> mobiles, required String brandName}) {
    List<MobileModel> brandList = [];
    for (int i = 0; i < mobiles.length; i++) {
      if (mobiles[i]
          .brandName
          .toLowerCase()
          .contains(brandName.toLowerCase())) {
        if (!brandList.contains(mobiles[i])) {
          brandList.add(mobiles[i]);
        }
      }
    }
    return brandList;
  }

  Either<bool, MobileWithThemeModel> isScreenCompatible(
      {required MobileModel requiredMobile,
      required MobileModel comingMobile}) {
    return _isCompatible(
        requiredMobile: requiredMobile,
        comingMobile: comingMobile,
        biggestDifferenceBetweenScreenSizes:
            biggestPossibleDifferenceBetweenDisplaysInScreens);
  }

  Either<bool, MobileWithThemeModel> isGlassCompatible(
      {required MobileModel requiredMobile,
      required MobileModel comingMobile}) {
    return _isCompatible(
        requiredMobile: requiredMobile,
        comingMobile: comingMobile,
        biggestDifferenceBetweenScreenSizes:
            biggestPossibleDifferenceBetweenDisplaysInGlass);
  }

  Either<bool, MobileWithThemeModel> _isCompatible(
      {required MobileModel requiredMobile,
      required MobileModel comingMobile,
      required double biggestDifferenceBetweenScreenSizes}) {
    String requiredBrand = requiredMobile.brandName;
    String requiredMobileName = requiredMobile.mobileName;
    double requiredDisplaySize = requiredMobile.displaySize;

    String comingBrand = comingMobile.brandName;
    String comingMobileName = comingMobile.mobileName;
    double comingDisplaySize = comingMobile.displaySize;

    if (requiredBrand.toLowerCase() == appleText.toLowerCase()) {
      if (requiredBrand == comingBrand &&
          requiredDisplaySize == comingDisplaySize &&
          requiredMobileName != comingMobileName) {
        return Right(getMobileWithTheme(requiredMobile));
      }
    } else {
      double differenceBetweenTwoScreenSizes = double.parse(
          (requiredDisplaySize - comingDisplaySize).abs().toStringAsFixed(2));

      if (requiredMobileName != comingMobileName &&
          differenceBetweenTwoScreenSizes <=
              biggestDifferenceBetweenScreenSizes) {
        return Right(getMobileWithTheme(requiredMobile));
      }
    }

    return const Left(false);
  }

  List<MobileWithThemeModel> getScreensCompatibilities(
      {required List<MobileModel> mobiles, required MobileModel mobile}) {
    return getCompatibilities(
        mobiles: mobiles,
        mobile: mobile,
        biggestDifferenceBetweenScreenSizes:
            biggestPossibleDifferenceBetweenDisplaysInScreens);
  }

  List<MobileWithThemeModel> getCoversCompatibilities(
      {required List<MobileModel> mobiles, required MobileModel mobile}) {
    List<MobileModel> list = [];
    for (MobileModel m in mobiles) {
      if (m.mobileId != mobile.mobileId) {
        list.add(m);
      }
    }
    return getMobilesWithTheme(mobiles: list);
  }

  List<MobileWithThemeModel> getGlassCompatibilities(
      {required List<MobileModel> mobiles, required MobileModel mobile}) {
    return getCompatibilities(
        mobiles: mobiles,
        mobile: mobile,
        biggestDifferenceBetweenScreenSizes:
            biggestPossibleDifferenceBetweenDisplaysInGlass);
  }

  List<MobileWithThemeModel> getCompatibilities(
      {required List<MobileModel> mobiles,
      required MobileModel mobile,
      required double biggestDifferenceBetweenScreenSizes}) {
    String requiredBrandName = mobile.brandName.toLowerCase();
    String requiredMobileName = mobile.mobileName.toLowerCase();

    List<MobileWithThemeModel> filteredList = [];

    // check if required mobile is from Apple brand
    if (requiredBrandName == appleText.toLowerCase()) {
      for (int mobileModelIndex = 0;
          mobiles.length > mobileModelIndex;
          mobileModelIndex++) {
        MobileModel comingModel = mobiles[mobileModelIndex];
        String comingBrand = mobiles[mobileModelIndex].brandName.toLowerCase();
        String comingMobileName =
            mobiles[mobileModelIndex].mobileName.toLowerCase();

        if (comingBrand == requiredBrandName &&
            comingModel.displaySize == mobile.displaySize &&
            requiredMobileName != comingMobileName) {
          filteredList.add(getMobileWithTheme(comingModel));
        }
      }
    }
    // else required mobile is from other brand other than Apple
    else {
      // first filter mobiles list by brands order in list
      for (int brandNameIndex = 0;
          brandsNamesTextsList.length > brandNameIndex;
          brandNameIndex++) {
        String brandName = brandsNamesTextsList[brandNameIndex].toLowerCase();
        // then filter mobiles by screen sizes
        for (int mobileModelIndex = 0;
            mobiles.length > mobileModelIndex;
            mobileModelIndex++) {
          String comingBrandName =
              mobiles[mobileModelIndex].brandName.toLowerCase();
          String comingMobileName =
              mobiles[mobileModelIndex].mobileName.toLowerCase();
          MobileModel comingMobile = mobiles[mobileModelIndex];
          double differenceBetweenTwoScreenSizes = double.parse(
              (comingMobile.displaySize - mobile.displaySize)
                  .abs()
                  .toStringAsFixed(2));


          if (brandName == comingBrandName &&
              comingBrandName != appleText.toLowerCase() &&
              requiredMobileName != comingMobileName &&
              differenceBetweenTwoScreenSizes <=
                  biggestDifferenceBetweenScreenSizes) {
            filteredList.add(getMobileWithTheme(comingMobile));
          }
        }
      }
    }

    return filteredList;
  }
}
