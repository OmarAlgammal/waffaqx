
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wafaq_x/presentation/bloc/register__cubit/register_cubit.dart';
import 'package:wafaq_x/presentation/bloc/register__cubit/register_state.dart';
import 'package:wafaq_x/presentation/constants/constantsColors.dart';
import 'package:wafaq_x/presentation/constants/constantsDimens.dart';
import 'package:wafaq_x/presentation/constants/texts/paths.dart';
import 'package:wafaq_x/presentation/constants/texts/texts.dart';
import 'package:wafaq_x/presentation/pages/home_page.dart';
import 'package:wafaq_x/presentation/utilities/routes.dart';
import 'package:wafaq_x/presentation/widgets/buttons/loading_button.dart';
import 'package:wafaq_x/presentation/widgets/buttons/circular_button.dart';
import 'package:wafaq_x/presentation/widgets/show_my_snack_bar.dart';


class AdminRegisterPage extends StatefulWidget {
  const AdminRegisterPage({Key? key}) : super(key: key);


  @override
  _AdminRegisterPageState createState() => _AdminRegisterPageState();
}

class _AdminRegisterPageState extends State<AdminRegisterPage> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: [
              SvgPicture.asset(loginPageBackgroundPath, fit: BoxFit.fitWidth,),
              Padding(
                padding: padding8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        loginAsAdminText,
                        style: TextStyle(
                          color: vodkaColor,
                          fontSize: size16,
                        ),
                      ),
                    ),
                    gap4,
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: circular12,
                        color: newGrayColor,
                      ),
                      child: Padding(
                        padding: paddingH8,
                        child: Form(
                          key: _loginFormKey,
                          child: Padding(
                            padding: paddingV16,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size56,
                                  child: TextFormField(
                                    // todo: remove this email before uploading on google play
                                    controller: _emailController..text = 'omar@waffaqx.com',
                                    validator: (value){
                                      if (value!.trim().isEmpty){
                                        return '';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                      errorBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: redColor)
                                      ),
                                      hintText: accountNameText,
                                      filled: true,
                                      fillColor: whiteColor,
                                      border: OutlineInputBorder(
                                          borderRadius: circular12,
                                          borderSide: BorderSide.none
                                      ),
                                    ),
                                  ),
                                ),
                                gap12,
                                SizedBox(
                                  height: size56,
                                  child: TextFormField(
                                    // todo: remove this password before uploading on google play
                                    controller: _passwordController..text = 'omar',
                                    obscureText: true,
                                    validator: (value){
                                      if (value!.trim().isEmpty){
                                        return '';
                                      }
                                      return null;
                                    },
                                    decoration: const InputDecoration(
                                        hintText: passwordText,
                                        filled: true,
                                        fillColor: whiteColor,
                                        errorBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(color: redColor)
                                        ),
                                        border: OutlineInputBorder(
                                          borderRadius:circular12,
                                          borderSide: BorderSide.none,
                                        )
                                    ),
                                  ),
                                ),
                                gap24,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
// login as admin button
                                    Flexible(
                                      flex: 1,
                                      child: Container(
                                        height: size46,
                                        decoration: const BoxDecoration(
                                          borderRadius: circular_infinity,
                                          color: vodkaColor,
                                        ),
                                        child: Center(
                                          child: BlocConsumer<RegisterCubit, RegisterState>(
                                            listener: (context, state){
                                              if (state is RegisterFailure){
                                                showMySnackBar(context: context, content: adminLoginErrorText, color: redColor);
                                              }
                                              else if (state is AdminSignedInSuccessfully){
                                                Navigator.pushNamed(context, AppRoutes.homePage);
                                              }
                                            },
                                            builder: (context, state){
                                              if (state is RegisterInProgress){
                                                return const LoadingButton();
                                              }
                                              return CircularButton(
                                                  text: loginText,
                                                  filled: true,
                                                  onPressed: (){
                                                    if (_loginFormKey.currentState!.validate()){
                                                      BlocProvider.of<RegisterCubit>(context).singInAsAdmin(email: _emailController.text, password: _passwordController.text);
                                                    }
                                                  });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
// login as user button
                                    Flexible(
                                        flex: 1,
                                        child: Center(
                                            child: TextButton(
                                              child: const Text(
                                                loginAsUserText,
                                                style: TextStyle(
                                                    color: vodkaColor,
                                                    decoration: TextDecoration.underline
                                                ),
                                              ),
                                              onPressed: (){
                                                BlocProvider.of<RegisterCubit>(context).singInAsUser();
                                              },
                                            )
                                        )
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    gap150
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
