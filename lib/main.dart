import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:wafaq_x/data/data_source/local_data_source.dart';
import 'package:wafaq_x/data/repos/admins_repository_impl.dart';
import 'package:wafaq_x/data/repos/compatibilities_repository_impl.dart';
import 'package:wafaq_x/data/repos/mobiles_repository_impl.dart';
import 'package:wafaq_x/domain/use_cases/admins_use_cases.dart';
import 'package:wafaq_x/domain/use_cases/compatibilities_use_cases.dart';
import 'package:wafaq_x/domain/use_cases/mobiles_use_cases.dart';
import 'package:wafaq_x/presentation/bloc/all_mobiles_cubit/all_mobiles_cubit.dart';
import 'package:wafaq_x/presentation/bloc/bloc_observer.dart';
import 'package:wafaq_x/presentation/bloc/dealing_with_cover_compatibilities_cubit/dealing_with_covers_compatibilities_cubit.dart';
import 'package:wafaq_x/presentation/bloc/register__cubit/register_cubit.dart';
import 'package:wafaq_x/presentation/constants/constantsColors.dart';
import 'package:wafaq_x/data/data_source/firebase_data_source.dart';
import 'package:wafaq_x/presentation/constants/constantsDimens.dart';
import 'package:wafaq_x/presentation/pages/all_covers_compatibilities_page.dart';
import 'package:wafaq_x/presentation/pages/set_admin_page.dart';
import 'package:wafaq_x/presentation/pages/compatibilities_page.dart';
import 'package:wafaq_x/presentation/pages/add_mobile_page.dart';
import 'package:wafaq_x/presentation/pages/brand_page.dart';
import 'package:wafaq_x/presentation/pages/add_covers_compatibility_page.dart';
import 'package:wafaq_x/presentation/pages/home_page.dart';
import 'package:wafaq_x/presentation/pages/admin_register_page.dart';
import 'package:wafaq_x/presentation/pages/mobile_page.dart';
import 'package:wafaq_x/presentation/pages/log_in_state_page.dart';
import 'package:wafaq_x/presentation/pages/selection_mobile_page.dart';
import 'package:wafaq_x/presentation/pages/start_page.dart';
import 'package:wafaq_x/presentation/pages/search_for_compatibilities_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'presentation/bloc/glass_compatibilities_cubit/glass_compatibilities_bloc.dart';
import 'presentation/bloc/mobile_covers_compatibilities_cubit/mobile_covers_compatibities_bloc.dart';
import 'presentation/bloc/screens_compatibilities/screensCompatibilitiesBloc.dart';

void main() async {

  BlocOverrides.runZoned(() async{

    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    await Firebase.initializeApp();
    runApp(const MyApp());
  },
  blocObserver: MobilesObserver());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('we are here');
    CompatibilitiesUseCases compatibilitiesUseCases = CompatibilitiesUseCases(CompatibilitiesRepositoryImpl(FirebaseDataSource()),
        MobilesRepositoryImpl(FirebaseDataSource()));
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(AdminsUseCases(AdminsRepositoryImpl(FirebaseDataSource(), LocalDataSource())))..whoIsSignedIn(),
        ),
        BlocProvider<AllMobilesCubit>(
          create: (context) => AllMobilesCubit(MobilesUseCases(MobilesRepositoryImpl(FirebaseDataSource())))..loadAllMobiles(),
        ),
        BlocProvider<ScreensCompatibilitiesCubit>(
          create: (context) => ScreensCompatibilitiesCubit(compatibilitiesUseCases),
        ),
        BlocProvider<GlassCompatibilitiesCubit>(
          create: (context) => GlassCompatibilitiesCubit(compatibilitiesUseCases),
        ),
        BlocProvider<MobileCoversCompatibilitiesCubit>(
          create: (context) => MobileCoversCompatibilitiesCubit(compatibilitiesUseCases),
        ),
        BlocProvider<DealingWithCoversCompatibilitiesCubit>(
          create: (context) => DealingWithCoversCompatibilitiesCubit(compatibilitiesUseCases),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          StartPage.routeName: (context) => const StartPage(),
          AdminRegisterPage.routeName: (context) => const AdminRegisterPage(),
          SetAdminPage.routeName: (context) => const SetAdminPage(),
          HomePage.routeName: (context) => const HomePage(),
          AllCoversCompatibilitiesPage.routeName: (context) => const AllCoversCompatibilitiesPage(),
          AddSelectionPage.routeName: (context) => const AddSelectionPage(),
          SelectionMobilePage.routeName: (context) => const SelectionMobilePage(),
          AddMobilePage.routeName: (context) => const AddMobilePage(),
          BrandPage.routeName: (context) => const BrandPage(),
          SearchForCompatibilitiesPage.routeName: (context) =>
          const SearchForCompatibilitiesPage(),
          CompatibilitiesPage.routName: (
              context) => const CompatibilitiesPage(),
          MobilePage.routeName: (context) => MobilePage(),
        },
        theme: ThemeData(
          primarySwatch: myCustomPrimaryColor,
          appBarTheme: const AppBarTheme(
              backgroundColor: brightGrayColor,
            titleTextStyle: TextStyle(
              color: blackColor,
              fontSize: size24,
            ),
            elevation: size8,
            toolbarHeight: size72,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: brightGrayColor,
              statusBarIconBrightness: Brightness.dark,
            )
          )
        ),
        home: const SafeArea(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: LogInStatePage(),
          ),
        ),
      ),
    );
  }

}
