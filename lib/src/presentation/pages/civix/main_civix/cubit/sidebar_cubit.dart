import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

//State is bool que indica solo si esta abierto el side bar => no se usa!!

class SideBarCubit extends Cubit<bool> {
  SideBarCubit() : super(false);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  void openMovilDrawable() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
      emit(true);
    }
  }

  void closeMobileDrawable() {
    if (_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openEndDrawer();
      emit(false);
    }
  }
}
