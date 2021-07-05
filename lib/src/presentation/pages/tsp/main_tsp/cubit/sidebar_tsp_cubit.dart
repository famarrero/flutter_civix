import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SideBarTspCubit extends Cubit<bool> {
  SideBarTspCubit() : super(false);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void openMobilDrawable() {
    if (!_scaffoldKey.currentState!.isEndDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
      emit(true);
    }
  }

  void closeMobileDrawable() {
    if (_scaffoldKey.currentState!.isEndDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
      emit(false);
    }
  }
}
