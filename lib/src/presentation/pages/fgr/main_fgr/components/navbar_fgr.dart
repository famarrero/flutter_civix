import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/constants/colors.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/main_fgr/cubit/sidebar_fgr_cubit.dart';
import 'package:provider/provider.dart';

class NavBarFgr extends StatefulWidget {
  const NavBarFgr();

  @override
  _NavBarFgrState createState() => _NavBarFgrState();
}

class _NavBarFgrState extends State<NavBarFgr> {
  bool get showNab {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: showNab ? kToolbarHeight : 0,
      width: double.infinity,
      decoration: _buildBoxDecoration(),
      child: Row(
        children: [
          SizedBox(width: 4),
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white)),
          Spacer(),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications, color: Colors.white)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.sync, color: Colors.white)),
          IconButton(
              icon: Icon(Icons.qr_code_scanner, color: Colors.white),
              onPressed: () {}),
          IconButton(
              icon: Icon(Icons.menu_outlined, color: Colors.white),
              onPressed: () {
                context.read<SideBarFgrCubit>().openMovilDrawable();
              })
        ],
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(color: kFgrPrimaryColor,
      //Color fgr
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]);
}
