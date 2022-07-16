import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wafaq_x/controllers/add_cover_compatibilities_cubit/add_cover_comp_cubit.dart';
import 'package:wafaq_x/controllers/add_mobile_cubit/add_mobile_cubit.dart';
import 'package:wafaq_x/controllers/auth_cubit/log_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wafaq_x/controllers/delete_comp_cubit/delete_comp_cubit.dart';
import 'package:wafaq_x/controllers/mobiles_bloc/mobiles_bloc.dart';
import 'package:wafaq_x/controllers/mobiles_bloc/mobiles_event.dart';
import 'package:wafaq_x/controllers/set_admin_cubit/set_admin_cubit.dart';
import 'package:wafaq_x/utilities/constants/constantsColors.dart';
import 'package:wafaq_x/utilities/constants/constantsDimens.dart';
import 'package:wafaq_x/utilities/routers.dart';
import 'package:wafaq_x/utilities/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => LogCubit()..isRegistered(),
        ),
        BlocProvider(create: (_) => MobilesBloc()),
        BlocProvider(
          create: (_) => AddMobileCubit(),
        ),
        BlocProvider(
          create: (_) => SetAdminCubit(),
        ),
        BlocProvider(
          create: (_) => AddCoverCompCubit(),
        ),
        BlocProvider(
          create: (_) => DeleteCompCubit(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.landingPage,
        onGenerateRoute: onGenerate,
        theme: ThemeData(
            primarySwatch: myCustomPrimaryColor,
            scaffoldBackgroundColor: whiteColor,
            appBarTheme: const AppBarTheme(
              backgroundColor: whiteColor,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: whiteColor,
                statusBarIconBrightness: Brightness.dark,
              ),
              iconTheme: IconThemeData(
                color: blackColor,
              ),
              titleTextStyle: TextStyle(
                color: blackColor,
                fontSize: size24,
              ),
              elevation: size0,
              toolbarHeight: size120,
            )),
      ),
    );
  }
}
