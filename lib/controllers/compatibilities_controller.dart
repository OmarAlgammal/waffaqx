import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:wafaq_x/models/mobile_model/mobile_model.dart';
import 'package:wafaq_x/models/requiredMobileModel.dart';
import 'package:wafaq_x/services/firestore_sevices.dart';
import 'package:wafaq_x/utilities/constants/texts/api.dart';
import 'package:wafaq_x/utilities/constants/texts/texts.dart';
import 'package:wafaq_x/utilities/enums/compatibilities.dart';
import 'package:wafaq_x/utilities/helper/mobiles_filtration_helper.dart';

class CompatibilitiesController {
  FirestoreServices _fireStore = FirestoreServices.instance;
  MobilesFiltrationHelper _filtrationHelper = MobilesFiltrationHelper();

  Stream<List<MobileModel>> compatibilities(
      {required Compatibilities type, required MobileModel mobile}) {
    return screenAndGlassCompatibilities(mobile: mobile, type: type);
  }

  Stream<List<MobileModel>> screenAndGlassCompatibilities(
      {required MobileModel mobile, required Compatibilities type}) {
    final result = _fireStore.collectionStream(
        path: mobilesPath,
        builder: (map) {
          return MobileModel.fromJson(map!);
        },
        queryBuilder: (query) {
          if (Compatibilities.screens == type) {
            query = query.where(
              displaySizeParameter,
              isLessThanOrEqualTo: (mobile.displaySize +
                  _filtrationHelper
                      .biggestPossibleDifferenceBetweenDisplaysInScreens),
              isGreaterThanOrEqualTo: (mobile.displaySize -
                  _filtrationHelper
                      .biggestPossibleDifferenceBetweenDisplaysInScreens),
            );
          } else {
            query = query.where(
              displaySizeParameter,
              isLessThanOrEqualTo: (mobile.displaySize +
                  _filtrationHelper
                      .biggestPossibleDifferenceBetweenDisplaysInGlass),
              isGreaterThanOrEqualTo: (mobile.displaySize -
                  _filtrationHelper
                      .biggestPossibleDifferenceBetweenDisplaysInGlass),
            );
          }
          return query;
        });
    return result;
  }



  Stream<List<List<MobileModel>>> coverCompatibilities({required MobileModel myMobile}) {
    final firstStream = _fireStore.collectionStream(
        path: '$coversPath',
        builder: (map) {
          List<dynamic> listOfMap = map![compParameter];

          bool comp = false;
          List<MobileModel> mobiles = [];
          for (map in listOfMap){
            MobileModel mobile  = MobileModel.fromJson(map!);
            mobiles.add(mobile);
            if (mobile.mobileId == myMobile.mobileId){
              comp = true;
            }
          }
          if (comp)
            return mobiles;
          List<MobileModel> m =[];
          return m;
    });

    debugPrint('first stream is ${firstStream.toString()}');
    return firstStream;
  }


  Stream<List<List<MobileModel>>> allComp(){
    debugPrint('in all comp');
    final firstStream = _fireStore.collectionStream(
        path: '$coversPath',
        builder: (map) {
          List<dynamic> listOfMap = map![compParameter];

          List<MobileModel> mobiles = [];
          for (map in listOfMap){
            MobileModel mobile  = MobileModel.fromJson(map!);
            mobiles.add(mobile);
          }

          return mobiles;
        });

    return firstStream;
  }

}
