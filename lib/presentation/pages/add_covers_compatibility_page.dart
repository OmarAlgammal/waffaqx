import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/controllers/add_cover_compatibilities_cubit/add_cover_comp_cubit.dart';
import 'package:wafaq_x/controllers/add_cover_compatibilities_cubit/add_cover_comp_state.dart';
import 'package:wafaq_x/models/requiredMobileModel.dart';
import 'package:wafaq_x/presentation/widgets/buttons/circular_button.dart';
import 'package:wafaq_x/presentation/widgets/buttons/loading_button.dart';
import 'package:wafaq_x/presentation/widgets/search_box.dart';
import 'package:wafaq_x/presentation/widgets/show_my_snack_bar.dart';
import 'package:wafaq_x/utilities/constants/constantsColors.dart';
import 'package:wafaq_x/utilities/routes.dart';

import '../../utilities/constants/constantsDimens.dart';
import '../../utilities/constants/texts/texts.dart';

class AddSelectionPage extends StatefulWidget {
  const AddSelectionPage({Key? key}) : super(key: key);

  @override
  _AddSelectionPageState createState() =>
      _AddSelectionPageState();
}

class _AddSelectionPageState
    extends State<AddSelectionPage> {

  late MobileWithThemeModel firstMobile, secondMobile;
  String? firstMobileName, secondMobileName;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            addCoversCompatibilitiesText,
          ),
        ),
        body: Padding(
          padding: padding8,
          child: ListView(
            children: [
              gap24,
              gap12,
              const Text(
                chooseFirstDeviceText,
                style: TextStyle(
                  fontSize: size18,
                ),
              ),
// first device search box
              SearchBox(
                title: firstMobileName,
                onPressed: () async {
                  var result = await Navigator.pushNamed(
                      context, AppRoutes.selectionMobilePage, arguments: selectFirstMobileText);
                  if (result != null) {
                    firstMobile = result as MobileWithThemeModel;
                    setState(() {
                      firstMobileName =
                          firstMobile.mobileModel.brandName +
                              ' ' +
                              firstMobile.mobileModel.mobileName;
                    });
                  }
                },
              ),
              gap8,
              const Text(
                chooseSecondDeviceText,
                style: TextStyle(
                  fontSize: size18,
                ),
              ),
// second device search box
              SearchBox(
                title: secondMobileName,
                onPressed: () async {
                  var result = await Navigator.pushNamed(
                      context, AppRoutes.selectionMobilePage, arguments: selectSecondMobileText);
                  if (result != null) {
                    secondMobile = result as MobileWithThemeModel;
                    setState(() {
                      secondMobileName =
                          secondMobile.mobileModel.brandName +
                              ' ' +
                              secondMobile.mobileModel.mobileName;
                    });
                  }
                },
              ),
              gap24,
              BlocConsumer<AddCoverCompCubit, AddCoverCompState>(
                  listener: (context, state) {
                    if (state is CoverCompAddingSuccessfully){
                      return showMySnackBar(context: context, content: coversCompatibilityAddedSuccessfullyText, color: vodkaColor);
                    }
                    else if (state is AddingCoverCompFailed){
                      return showMySnackBar(context: context, content: anErrorOccurredText, color: redColor);
                    }
                  },
                  builder: (context, state) {
                    if (state is AddingCoverComp) {
                      return const LoadingButton();
                    }
                    return CircularButton(
                        text: additionText,
                        filled: true,
                        onPressed: () {
                          if (firstMobileName == null || secondMobileName == null){
                            return showMySnackBar(context: context, content: youShouldSelectFirstAndSecondMobileText, color: redColor);
                          }
                          if (firstMobileName == secondMobileName){
                            return showMySnackBar(context: context, content: firstMobileShouldNotEqualToSecondMobileText, color: redColor);
                          }
                          if (firstMobileName != secondMobileName) {
                            BlocProvider.of<AddCoverCompCubit>(context)
                                .addCoverComp(
                                    firstMobile:
                                        firstMobile.mobileModel,
                                    secondMobile:
                                        secondMobile.mobileModel);
                          }
                        });
                  }),

            ],
          ),
        ),
      ),
    );
  }
}
