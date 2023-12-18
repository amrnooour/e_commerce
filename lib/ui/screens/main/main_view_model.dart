import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewModel extends Cubit {
  MainViewModel() : super(MainInitialState());
  int currentTabIndex = 0;

  void changeSelectedTab(int newIndex) {
    currentTabIndex = newIndex;
    emit(MainInitialState());
  }
}

class MainInitialState {}