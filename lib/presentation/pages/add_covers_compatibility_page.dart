import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/presentation/entities/requiredMobileModel.dart';
import 'package:wafaq_x/presentation/bloc/all_mobiles_cubit/all_mobiles_cubit.dart';
import 'package:wafaq_x/presentation/bloc/dealing_with_cover_compatibilities_cubit/dealing_with_covers_compatibilities_cubit.dart';
import 'package:wafaq_x/presentation/bloc/dealing_with_cover_compatibilities_cubit/dealing_with_covers_compatibilities_state.dart';
import 'package:wafaq_x/presentation/constants/constantsColors.dart';
import 'package:wafaq_x/presentation/constants/constantsDimens.dart';
import 'package:wafaq_x/presentation/constants/texts/texts.dart';
import 'package:wafaq_x/presentation/pages/selection_mobile_page.dart';
import 'package:wafaq_x/presentation/utilities/routes.dart';
import 'package:wafaq_x/presentation/widgets/buttons/circular_button.dart';
import 'package:wafaq_x/presentation/widgets/buttons/loading_button.dart';
import 'package:wafaq_x/presentation/widgets/search_box.dart';
import 'package:wafaq_x/presentation/widgets/show_my_snack_bar.dart';

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
                  BlocProvider.of<AllMobilesCubit>(context).loadAllMobiles();
                  var result = await Navigator.pushNamed(
                      context, AppRoutes.selectionMobilePage);
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
                  BlocProvider.of<AllMobilesCubit>(context).loadAllMobiles();
                  var result = await Navigator.pushNamed(
                      context, AppRoutes.selectionMobilePage);
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
              BlocConsumer<DealingWithCoversCompatibilitiesCubit, DealingWithCoversCompatibilitiesState>(
                  listener: (context, state) {
                    if (state is CompatibilitiesAddedSuccessfully){

                      return showMySnackBar(context: context, content: coversCompatibilityAddedSuccessfullyText, color: vodkaColor);
                    }
                    else if (state is DealingWithCoversCompatibilitiesFailed){
                      return showMySnackBar(context: context, content: anErrorOccurred, color: redColor);
                    }
                  },
                  builder: (context, state) {
                    if (state is DealingWithCoversCompatibilitiesLoadInProgress) {
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
                            BlocProvider.of<DealingWithCoversCompatibilitiesCubit>(context)
                                .addCoversCompatibility(
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
