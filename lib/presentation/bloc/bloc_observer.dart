

import 'package:flutter_bloc/flutter_bloc.dart';

class MobilesObserver extends BlocObserver{


  @override
  void onCreate(BlocBase bloc) {
    print('$bloc');
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('$bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print('$bloc $error $stackTrace');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('$bloc $transition');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('$bloc $change');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('$bloc $event');
  }

}