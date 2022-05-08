
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wafaq_x/data/data_source/firebase_data_source.dart';
import 'package:wafaq_x/data/repos/compatibilities_repository_impl.dart';
import 'package:wafaq_x/data/repos/mobiles_repository_impl.dart';
import 'package:wafaq_x/domain/use_cases/compatibilities_use_cases.dart';
import 'package:wafaq_x/presentation/bloc/all_covers_compatibilities_bloc/all_covers_compatibiliteies_bloc.dart';
import 'package:wafaq_x/presentation/bloc/all_covers_compatibilities_bloc/all_covers_compatibilities_event.dart';
import 'package:wafaq_x/presentation/bloc/all_covers_compatibilities_bloc/all_covers_compatibilities_state.dart';
import 'package:wafaq_x/presentation/constants/constantsDimens.dart';
import 'package:wafaq_x/presentation/constants/texts/texts.dart';
import 'package:wafaq_x/presentation/widgets/lists/all_covers_compatibilities_list.dart';
import 'package:wafaq_x/presentation/widgets/texts/error_occurred.dart';
import 'package:wafaq_x/presentation/widgets/texts/loading.dart';
import 'package:wafaq_x/presentation/widgets/texts/no_results_found.dart';

class AllCoversCompatibilitiesPage extends StatefulWidget {
  const AllCoversCompatibilitiesPage({Key? key}) : super(key: key);

  static String routeName = 'AllCoversCompatibilitiesPage';

  @override
  _AllCoversCompatibilitiesPageState createState() => _AllCoversCompatibilitiesPageState();
}

class _AllCoversCompatibilitiesPageState extends State<AllCoversCompatibilitiesPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AllCoversCompatibilitiesBloc>(
      create: (context) => AllCoversCompatibilitiesBloc(CompatibilitiesUseCases(CompatibilitiesRepositoryImpl(FirebaseDataSource()),
        MobilesRepositoryImpl(FirebaseDataSource())),)..add(LoadCoversCompatibilities()),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text(
              coversCompatibilitiesText,
            ),
          ),
          body: Padding(
            padding: padding8,
            child: Center(
              child: displayList(),
            ),
          ),
        ),
      ),
    );
  }

  displayList(){
    return BlocBuilder<AllCoversCompatibilitiesBloc, CoversCompatibilitiesState>(
        builder: (context, state) {
          if (state is CoversCompatibilitiesLoadInProgress){
            return const Loading();
          }
          else if (state is CoversCompatibilitiesLoadSuccessfully){
            if (state.allCompatibilities.isEmpty){
              return const NoResultsFound();
            }
            else {
              return AllCoversCompatibilitiesList(allCompatibilities: state.allCompatibilities,);
            }
          }
          else {
            return const ErrorOccurred();
          }
        }
    );
  }

}
