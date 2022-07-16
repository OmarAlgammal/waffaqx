import 'package:flutter/material.dart';
import 'package:wafaq_x/controllers/compatibilities_controller.dart';
import 'package:wafaq_x/models/arguments/compatibilities_page_arguments.dart';
import 'package:wafaq_x/models/mobile_model/mobile_model.dart';
import 'package:wafaq_x/models/requiredMobileModel.dart';
import 'package:wafaq_x/presentation/widgets/images/brandLogo.dart';
import 'package:wafaq_x/presentation/widgets/dividers/skinnyDivider.dart';
import 'package:wafaq_x/presentation/widgets/lists/mobiles_list.dart';
import 'package:wafaq_x/presentation/widgets/texts/error_occurred.dart';
import 'package:wafaq_x/presentation/widgets/texts/loading.dart';
import 'package:wafaq_x/presentation/widgets/texts/no_results_found.dart';
import 'package:wafaq_x/presentation/widgets/texts/side_title.dart';
import 'package:wafaq_x/utilities/enums/compatibilities.dart';
import 'package:wafaq_x/utilities/extensions/wrappedRoundedCorner.dart';
import 'package:wafaq_x/utilities/helper/mobiles_filtration_helper.dart';
import '../../utilities/constants/constantsColors.dart';
import '../../utilities/constants/constantsDimens.dart';
import '../../utilities/constants/texts/texts.dart';
import '../widgets/texts/helper_text.dart';

class CompatibilitiesPage extends StatefulWidget {
  const CompatibilitiesPage({Key? key}) : super(key: key);


  @override
  _CompatibilitiesPageState createState() => _CompatibilitiesPageState();
}

class _CompatibilitiesPageState extends State<CompatibilitiesPage> {
  late CompatibilitiesPageArgument arguments;
  
  CompatibilitiesController _compatibilitiesController = CompatibilitiesController();

  MobilesFiltrationHelper _filtrationHelper = MobilesFiltrationHelper();

  Compatibilities type = Compatibilities.screens;
  late List<MobileWithThemeModel> _mobilesWithTheme;
  late MobileModel mobileModel;
  late String brandLogo;
  late Color brandColor;

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)!.settings.arguments as CompatibilitiesPageArgument;
    mobileModel = arguments.mobileWithTheme.mobileModel;
    brandLogo = arguments.mobileWithTheme.brandLogo;
    brandColor = arguments.mobileWithTheme.brandColor;

    return Scaffold(
      backgroundColor: whiteColor,
      body: Padding(
          padding: padding8,
          child: ListView(
            children: [
              gap8,
// brand logo
              brandLogoWidget(brandLogo: brandLogo, brandColor: brandColor),
              gap8,
// mobile name
              Text(
                mobileModel.mobileName,
                style: const TextStyle(
                  color: whiteColor,
                  fontSize: size24,
                ),
              ).wrappedRoundedCorner(brandColor: brandColor),
              gap16,
// available compatibilities helper text
              const HelperText(
                helperText: hereAvailableCompatibilities,
              ),
              gap8,
// categories
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
// glasses checkBox
                  const Text(
                    glassText,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Checkbox(
                    value: (type == Compatibilities.glasse)? true: false,
                    onChanged: (value) {
                      setState(() {
                        type = Compatibilities.glasse;
                      });
                    },
                  ),
// covers checkBox
                  const Text(
                    coversText,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Checkbox(
                    value: (type == Compatibilities.covers)? true: false,
                    onChanged: (value) {
                      setState(() {
                        type = Compatibilities.covers;
                      });
                    },
                  ),
// screens checkBox
                  const Text(
                    screensText,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Checkbox(
                    value: (type == Compatibilities.screens)? true: false,
                    onChanged: (value) {
                      setState(() {
                        type = Compatibilities.screens;
                      });
                    },
                  ),
                ],
              ),

              const SkinnyDivider(),
              gap8,
              const SideTitle(title: compatibilitiesText),

            if (type == Compatibilities.screens || type == Compatibilities.glasse)
              screensAndGlassCompList(),
             if (type == Compatibilities.covers)
               coverCompatibilitiesList(),
            ],
          )),
    );
  }

  coverCompatibilitiesList(){
    return StreamBuilder<List<List<MobileModel>>>(
      stream: _compatibilitiesController.coverCompatibilities(myMobile: arguments.mobileWithTheme.mobileModel),
      builder: (context, snapshot){
        if (snapshot.hasData){
          if (snapshot.connectionState == ConnectionState.waiting)
            return Loading();

          for (final mobiles in snapshot.data!){
            if (mobiles.isNotEmpty){
              final mobilesWithTheme = _filtrationHelper.getMobilesArrangementWithTheme(mobiles);
              return MobilesList(mobilesWithTheme: mobilesWithTheme);
            }
            return SizedBox();
          }
          return NoResultsFound();
        }else
          return NoResultsFound();
      },
    );
  }

  screensAndGlassCompList() {
    return StreamBuilder<List<MobileModel>>(
      stream: _compatibilitiesController.compatibilities(type: type, mobile: arguments.mobileWithTheme.mobileModel),
      builder: (context, snapshot){
        if (snapshot.hasData){
          if (snapshot.connectionState == ConnectionState.waiting)
            return Loading();
          else {
            if (snapshot.data!.isNotEmpty){

              List<dynamic> result = snapshot.data!;
              if (type == Compatibilities.screens)
                result = _filtrationHelper.getScreensCompatibilities(mobiles: snapshot.data!, mobile: arguments.mobileWithTheme.mobileModel);
              else if (type == Compatibilities.glasse)
                result = _filtrationHelper.getGlassCompatibilities(mobiles: snapshot.data!, mobile: arguments.mobileWithTheme.mobileModel);

              result = _filtrationHelper.getMobilesArrangementWithTheme(result);

              if (result.isNotEmpty)
                return MobilesList(mobilesWithTheme: result as List<MobileWithThemeModel>);
              else
                return NoResultsFound();

            }
            else
              return NoResultsFound();
          }
        }
        else
          return NoResultsFound();
      },
    );
  }

}
