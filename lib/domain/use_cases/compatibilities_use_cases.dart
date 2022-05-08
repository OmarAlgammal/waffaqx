
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wafaq_x/presentation/entities/requiredMobileModel.dart';
import 'package:wafaq_x/data/entities/mobile_model.dart';
import 'package:wafaq_x/domain/repos/compatibilities_repository.dart';
import 'package:wafaq_x/domain/repos/mobiles_repository.dart';
import 'package:wafaq_x/presentation/helper/mobiles_filtration_helper.dart';

class CompatibilitiesUseCases{

  final CompatibilitiesRepository _compatibilitiesRepository;
  final MobilesRepository _mobilesRepository;
  final MobilesFiltrationHelper _mobilesFiltrationHelper = MobilesFiltrationHelper();

  CompatibilitiesUseCases(this._compatibilitiesRepository, this._mobilesRepository);

  Future<void> addCoversCompatibility({required MobileModel firstMobile, required MobileModel secondMobile}) async{
    bool firstMobileState = false, secondMobileState = false;
    late List<String> firstMobileCollection, secondMobileCollection;

    //get all docs from covers compatibilities collection
    List<List<String>> allCompatibilitiesList = await _compatibilitiesRepository.getCoversCompatibilitiesList();

    for (List<String> list in allCompatibilitiesList){
      for (String id in list){
        if (id == firstMobile.mobileId){
          firstMobileState = true;
          firstMobileCollection = list;
        }
        if (id == secondMobile.mobileId){
          secondMobileState = true;
          secondMobileCollection = list;
        }
      }
    }


    if (firstMobileState && secondMobileState){
      throw UnimplementedError();
    }
    else if (!firstMobileState && !secondMobileState){
      List<String> newCompatibilities = [
        firstMobile.mobileId,
        secondMobile.mobileId
      ];
      await _compatibilitiesRepository.addCoversCompatibility(docId: firstMobile.mobileId, compatibilities: newCompatibilities);
    }
    else if (firstMobileState && !secondMobileState){
      firstMobileCollection.add(secondMobile.mobileId);
      await _compatibilitiesRepository.addCoversCompatibility(docId: firstMobileCollection.first, compatibilities: firstMobileCollection);
    }
    else if (!firstMobileState && secondMobileState){
      secondMobileCollection.add(firstMobile.mobileId);
      await _compatibilitiesRepository.addCoversCompatibility(docId: secondMobileCollection.first, compatibilities: secondMobileCollection);
    }

  }

  Stream<List<List<MobileWithThemeModel>>> getAllCoversCompatibilities() async*{
    Stream<List<List<String>>> allCompatibilitiesById =  _compatibilitiesRepository.getAllCoversCompatibilities();

    List<List<MobileWithThemeModel>> allCompatibilities = [];
    List<MobileModel> allMobiles = await _mobilesRepository.getAllMobiles();
    List<MobileModel> compatibilities = [];

    yield* allCompatibilitiesById.map((allIds) {
      allCompatibilities.clear();
      for (List<String> ids in allIds){
        for (String id in ids){
          for (MobileModel mobile in allMobiles){
            if (mobile.mobileId == id){
              compatibilities.add(mobile);
            }
          }
        }
        allCompatibilities.add(_mobilesFiltrationHelper.getMobilesWithTheme(mobiles: compatibilities));
        print('compatibilities length is ${compatibilities.length}');
        compatibilities.clear();
      }

      return allCompatibilities;

    });

    // await for (List<List<String>>? allLists in allCompatibilitiesById){
    //   allCompatibilitiesMobiles.clear();
    //   if (allLists != null){
    //     for (List<String> list in allLists){
    //       allCompatibilitiesMobiles.clear();
    //       List<MobileWithThemeModel> mobilesWithTheme = [];
    //       for (String id in list){
    //         MobileModel mobile = await _mobilesRepository.getMobile(mobileId: id);
    //         mobilesWithTheme.add(_mobilesFiltrationHelper.getMobileWithTheme(mobile));
    //       }
    //       allCompatibilitiesMobiles.add(mobilesWithTheme);
    //       print('length of mobiles with theme ${mobilesWithTheme.length}');
    //       yield allCompatibilitiesMobiles;
    //     }
    //   }
    //   else if (allCompatibilitiesMobiles.isEmpty){
    //     print('yield here 0');
    //     yield [];
    //   }
    // }

  }

  Future<List<MobileWithThemeModel>> getCoversCompatibilities({required String mobileId}) async{
    List<MobileWithThemeModel> mobilesWithTheme = [];
    List<String> ids = [];

    List<List<String>> compatibilities = await _compatibilitiesRepository.getCoversCompatibilitiesList();

    for (List<String> list in compatibilities){
      // check if required id is exists in this list
      if (list.contains(mobileId)){
        ids = list;
      }
    }

    for (String id in ids) {
      MobileModel mobile = await _mobilesRepository.getMobile(mobileId: id);
      mobilesWithTheme.add(_mobilesFiltrationHelper.getMobileWithTheme(mobile));
    }
    return mobilesWithTheme;
  }

  Future <List<MobileModel>> _getAllMobiles() async{
    return await  _mobilesRepository.getAllMobiles();
  }

  Future <List<MobileWithThemeModel>> getBrandMobiles({required String brandName}) async{
    return await _getAllMobiles().then((mobiles) async{
      return _mobilesFiltrationHelper.getBrandMobilesWithTheme(mobiles: mobiles, brandName: brandName);
    });
  }

  Future <List<MobileWithThemeModel>> getScreenCompatibilities({required MobileModel mobile}) async{
    return await _getAllMobiles().then((mobiles) {
      return _mobilesFiltrationHelper.getScreensCompatibilities(mobiles: mobiles, mobile: mobile);
    });
  }

  Future <List<MobileWithThemeModel>> getGlassCompatibilities({required MobileModel mobile}) async{
    return await _getAllMobiles().then((mobiles) {
      return _mobilesFiltrationHelper.getGlassCompatibilities(mobiles: mobiles, mobile: mobile);
    });
  }

  Future<void> deleteCoverFromCompatibilities({required List<MobileWithThemeModel> mobilesWithTheme, required int index}) async{

    // get mobile ids
    List<String> ids = [];
    for(MobileWithThemeModel mobile in mobilesWithTheme){
      ids.add(mobile.mobileModel.mobileId);
    }

    await _compatibilitiesRepository.deleteCoversCollections(compatibilities: ids, index: index);
    if (mobilesWithTheme.length > 2){
      ids.removeAt(index);
      await _compatibilitiesRepository.addCoversCompatibility(docId: ids.first, compatibilities: ids);
    }

    // if (index == 0){
    //   await _compatibilitiesRepository.deleteCoversCollections(id: ids[index]);
    //   ids.removeAt(index);
    //   await _compatibilitiesRepository.addCoversCompatibility(docId: ids[index], compatibilities: ids);
    // }
    // else {
    //   ids.removeAt(index);
    //   await _compatibilitiesRepository.addCoversCompatibility(docId: ids[0], compatibilities: ids);

  }

}