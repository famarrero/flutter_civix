import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

//State is bool que indica solo si esta abierto el side bar => no se usa!!

class SideBarTspCubit extends Cubit<bool> {
  SideBarTspCubit() : super(false);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void openMovilDrawable() {
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
