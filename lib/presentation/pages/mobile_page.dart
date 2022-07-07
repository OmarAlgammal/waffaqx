import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wafaq_x/presentation/constants/texts/paths.dart';
import 'package:wafaq_x/presentation/entities/requiredMobileModel.dart';
import 'package:wafaq_x/data/entities/mobile_model.dart';
import 'package:wafaq_x/presentation/constants/constantsColors.dart';
import 'package:wafaq_x/presentation/constants/constantsDimens.dart';
import 'package:wafaq_x/presentation/constants/texts/texts.dart';
import 'package:wafaq_x/presentation/entities/arguments/mobile_page_arguments.dart';
import 'package:wafaq_x/presentation/extensions/wrappedRoundedCorner.dart';
import 'package:wafaq_x/presentation/helper/helper.dart';
import 'package:wafaq_x/presentation/widgets/icons/icon_from_assets.dart';
import 'package:wafaq_x/presentation/widgets/images/brandLogo.dart';
import 'package:wafaq_x/presentation/widgets/items_designs/mobile_feature_item_desing.dart';

class MobilePage extends StatelessWidget {

  late MobileModel _mobileModel;
  late Color _brandColor;
  final Helper _helper = Helper();


  @override
  Widget build(BuildContext context) {
    MobilePageArguments arguments = ModalRoute.of(context)!.settings.arguments as MobilePageArguments;
    MobileWithThemeModel _mobileWithThemeModel = arguments.mobileWithTheme;
    _mobileModel = _mobileWithThemeModel.mobileModel;
    _brandColor = _mobileWithThemeModel.brandColor;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size72,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: arguments.mobileWithTheme.brandColor,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: arguments.mobileWithTheme.brandColor,
        automaticallyImplyLeading: false,
        titleSpacing: size0,
        title: brandLogoWidget(brandLogo: arguments.mobileWithTheme.brandLogo, brandColor: arguments.mobileWithTheme.brandColor),
      ),
      body: Padding(
        padding: padding8,
        child: ListView(
          children: [
            gap8,
            Row(
              children: [
                Text(
                  _mobileModel.mobileName,
                  style: const TextStyle(
                    color: whiteColor,
                    fontSize: size24,
                  ),
                ).wrappedRoundedCorner(brandColor: _brandColor),
                gap8,
                IconFromAssets(path: imageIconPath, color: _brandColor,),
              ],
            ),
            MobileFeatureDetermination(mobileFeature: displayText, features: displayFeaturesTexts, description: _helper.objectToList(_mobileModel.displaySize), brandColor: _brandColor),
            MobileFeatureDetermination(mobileFeature: processorText, description: _helper.objectToList(_mobileModel.processor), brandColor: _brandColor),
            MobileFeatureDetermination(mobileFeature: storageAndRamText,  description: _helper.objectToList(_mobileModel.storageAndRam), brandColor: _brandColor),
            MobileFeatureDetermination(mobileFeature: mainCameraHintText, description: _helper.objectToList(_mobileModel.mainCameras), brandColor: _brandColor),
            MobileFeatureDetermination(mobileFeature: selfieCameraHintText, description: _helper.objectToList(_mobileModel.selfieCameras), brandColor: _brandColor),
            MobileFeatureDetermination(mobileFeature: batteryText, description: _helper.objectToList(_mobileModel.battery), brandColor: _brandColor),
            MobileFeatureDetermination(mobileFeature: osText, description: _helper.objectToList(_mobileModel.os), brandColor: _brandColor),

          ],
        ),
      ),

    );
  }



}
