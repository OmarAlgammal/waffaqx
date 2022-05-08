
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/presentation/entities/requiredMobileModel.dart';
import 'package:wafaq_x/presentation/bloc/glass_compatibilities_cubit/glass_compatibilities_bloc.dart';
import 'package:wafaq_x/presentation/bloc/mobile_covers_compatibilities_cubit/mobile_covers_compatibities_bloc.dart';
import 'package:wafaq_x/presentation/bloc/screens_compatibilities/screensCompatibilitiesBloc.dart';
import 'package:wafaq_x/presentation/constants/constantsColors.dart';
import 'package:wafaq_x/presentation/constants/constantsDimens.dart';
import 'package:wafaq_x/presentation/entities/arguments/compatibilities_page_arguments.dart';
import 'package:wafaq_x/presentation/entities/arguments/mobile_page_arguments.dart';
import 'package:wafaq_x/presentation/pages/compatibilities_page.dart';
import 'package:wafaq_x/presentation/pages/mobile_page.dart';

class MobileItemDesign extends StatelessWidget {
  const MobileItemDesign({Key? key, required this.mobileWithTheme}) : super(key: key);

  final MobileWithThemeModel mobileWithTheme;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingV4,
      child: ListTile(
        onTap: (){
          BlocProvider.of<ScreensCompatibilitiesCubit>(context)
              .loadScreensCompatibilities(requiredMobile: mobileWithTheme.mobileModel);

          BlocProvider.of<MobileCoversCompatibilitiesCubit>(context)
              .loadMobileCoversCompatibilities(mobileId: mobileWithTheme.mobileModel.mobileId);

          BlocProvider.of<GlassCompatibilitiesCubit>(context)
              .loadGlassCompatibilities(requiredMobile: mobileWithTheme.mobileModel);

          Navigator.pushNamed(context, CompatibilitiesPage.routName, arguments: CompatibilitiesPageArgument(mobileWithTheme: mobileWithTheme));
        },
          contentPadding: paddingH8,
          tileColor: mobileWithTheme.brandColor,
          shape: const RoundedRectangleBorder(
            borderRadius: circular12,
          ),
          title: Text(
            mobileWithTheme.mobileModel.mobileName,
            style: const TextStyle(color: whiteColor),
          ),
          trailing: IconButton(
            padding: padding0,
            icon: const Icon(
              Icons.article_outlined,
              color: whiteColor,
            ),
            onPressed: (){
              Navigator.pushNamed(context, MobilePage.routeName, arguments: MobilePageArguments(mobileWithTheme: mobileWithTheme));
            },
          )
      ),
    );
  }
}
