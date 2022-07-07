
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/presentation/entities/requiredMobileModel.dart';
import 'package:wafaq_x/presentation/bloc/dealing_with_cover_compatibilities_cubit/dealing_with_covers_compatibilities_cubit.dart';
import 'package:wafaq_x/presentation/bloc/dealing_with_cover_compatibilities_cubit/dealing_with_covers_compatibilities_state.dart';
import 'package:wafaq_x/presentation/constants/constantsColors.dart';
import 'package:wafaq_x/presentation/constants/constantsDimens.dart';
import 'package:wafaq_x/presentation/constants/constantsIcons.dart';
import 'package:wafaq_x/presentation/entities/arguments/compatibilities_page_arguments.dart';
import 'package:wafaq_x/presentation/pages/compatibilities_page.dart';
import 'package:wafaq_x/presentation/utilities/routes.dart';


class AllCoversCompatibilitiesListItemDesign extends StatelessWidget {
  const AllCoversCompatibilitiesListItemDesign({Key? key, required this.mobilesWithTheme, required this.index}) : super(key: key);

  final List<MobileWithThemeModel> mobilesWithTheme;
  final int index;


  @override
  Widget build(BuildContext context) {


    return Directionality(
      textDirection: TextDirection.ltr,
      child: Padding(
        padding: paddingV4,
        child: ListTile(
            contentPadding: paddingH8,
            tileColor: mobilesWithTheme[index].brandColor,
            shape: const RoundedRectangleBorder(
              borderRadius: circular12,
            ),
            onTap: (){
              Navigator.pushNamed(context, AppRoutes.compatibilitiesPage, arguments: CompatibilitiesPageArgument(mobileWithTheme: mobilesWithTheme[index]));
            },
            title: Text(
              mobilesWithTheme[index].mobileModel.mobileName,
              style: const TextStyle(color: whiteColor),
            ),
            trailing: IconButton(
              padding: padding0,
              icon: const Icon(
                removeCircularIcon,
                color: whiteColor,
              ),
              onPressed: (){
                BlocProvider.of<DealingWithCoversCompatibilitiesCubit>(context).deleteCoversCompatibilities(mobilesWithTheme: mobilesWithTheme, index: index);
              },
            )
        ),
      ),
    );
  }
}
