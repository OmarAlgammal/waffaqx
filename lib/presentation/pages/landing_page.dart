import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/controllers/auth_cubit/log_cubit.dart';
import 'package:wafaq_x/controllers/auth_cubit/log_state.dart';
import 'package:wafaq_x/presentation/pages/home_page.dart';
import 'package:wafaq_x/presentation/pages/login_page.dart';
import 'package:wafaq_x/utilities/routes.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogCubit, LogState>(
      buildWhen: (context, state){
        if (state is LogInSuccessfully || state is LoggedOutSuccessfully || state is NotRegisterYet)
          return true;
        return false;
      },
      builder: (context, state){
        if (state is LogInSuccessfully)
          return HomePage();
        else if (state is NotRegisterYet || state is LoggedOutSuccessfully)
          return LoginPage();

        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
