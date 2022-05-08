import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wafaq_x/presentation/bloc/register__cubit/register_cubit.dart';
import 'package:wafaq_x/presentation/bloc/register__cubit/register_state.dart';
import 'package:wafaq_x/presentation/constants/constantsDimens.dart';
import 'package:wafaq_x/presentation/constants/texts/paths.dart';
import 'package:wafaq_x/presentation/pages/home_page.dart';
import 'package:wafaq_x/presentation/pages/admin_register_page.dart';
import 'package:wafaq_x/presentation/widgets/buttons/circular_button.dart';
import 'package:wafaq_x/presentation/widgets/buttons/loading_button.dart';
import '../constants/texts/texts.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  static String routeName = 'startPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset(startPageBackgroundPath, fit: BoxFit.fitWidth,),
          Padding(
            padding: padding8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    BlocConsumer<RegisterCubit, RegisterState>(
                        listener: (context, state){
                          if (state is UserSignedInSuccessfully){
                            Navigator.pushReplacementNamed(context, HomePage.routeName);
                          }
                        },
                        builder: (context, state) {
                          if (state is RegisterInProgress){
                            return const LoadingButton();
                          }
                          else {
                            return CircularButton(text: loginAsUserText, onPressed: (){
                              BlocProvider.of<RegisterCubit>(context).singInAsUser();
                            },);
                          }
                        }
                    ),
                    gap8,
                    CircularButton(text: loginAsAdminText, filled: true, onPressed: (){
                      Navigator.pushNamed(context, AdminRegisterPage.routeName);
                    },),
                    gap16,
                  ],
                )
              ],
            ),
          ),

        ],
      )
    );
  }
}
