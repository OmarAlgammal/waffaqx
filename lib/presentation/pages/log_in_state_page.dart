import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/presentation/bloc/register__cubit/register_cubit.dart';
import 'package:wafaq_x/presentation/bloc/register__cubit/register_state.dart';
import 'package:wafaq_x/presentation/pages/home_page.dart';
import 'package:wafaq_x/presentation/pages/start_page.dart';

class LogInStatePage extends StatelessWidget {
  const LogInStatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
      if (state is UserSignedInSuccessfully || state is AdminSignedInSuccessfully) {
        return const HomePage();
      }
      return const StartPage();
    });
  }
}
