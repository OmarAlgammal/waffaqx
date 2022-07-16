import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wafaq_x/models/arguments/mobile_page_arguments.dart';
import 'package:wafaq_x/models/mobile_model/mobile_model.dart';
import 'package:wafaq_x/models/requiredMobileModel.dart';
import 'package:wafaq_x/presentation/widgets/icons/icon_from_assets.dart';
import 'package:wafaq_x/presentation/widgets/images/brandLogo.dart';
import 'package:wafaq_x/presentation/widgets/items_designs/mobile_feature_item_desing.dart';
import 'package:wafaq_x/utilities/extensions/wrappedRoundedCorner.dart';
import '../../utilities/constants/constantsColors.dart';
import '../../utilities/constants/constantsDimens.dart';
import '../../utilities/constants/texts/paths.dart';
import '../../utilities/constants/texts/texts.dart';
import '../../utilities/helper/helper.dart';

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
        padding: EdgeInsets.fromLTRB(size8, size8, size8, size0),
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
            MobileFeatureDetermination(mobileFeature: displayText, description: _mobileModel.displaySize.toString(), brandColor: _brandColor),
            MobileFeatureDetermination(mobileFeature: processorText, description: _mobileModel.processor, brandColor: _brandColor),
            MobileFeatureDetermination(mobileFeature: storageAndRamText,  description: _mobileModel.storageAndRam.toString(), brandColor: _brandColor),
            MobileFeatureDetermination(mobileFeature: mainCameraHintText, description: _mobileModel.mainCameras.toString(), brandColor: _brandColor),
            MobileFeatureDetermination(mobileFeature: selfieCameraHintText, description: _mobileModel.selfieCameras.toString(), brandColor: _brandColor),
            MobileFeatureDetermination(mobileFeature: batteryText, description: _mobileModel.battery, brandColor: _brandColor),
            MobileFeatureDetermination(mobileFeature: osText, description: _mobileModel.os, brandColor: _brandColor),
          ],
        ),
      ),

    );
  }



}
