import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/core/constants/dimens.dart';
import 'package:flutter_civix/src/data/models/general/province_model.dart';
import 'package:flutter_civix/src/injector.dart';
import 'package:flutter_civix/src/presentation/pages/general/entities_by_province/cubit/entities_by_province_cubit.dart';
import 'package:flutter_civix/src/presentation/widgets/appbar_title.dart';
import 'package:flutter_civix/src/presentation/widgets/entity_item.dart';

class EntitiesByProvincePage extends StatefulWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final MaterialColor primarySwatch;
  final String entitiesByProvinceJson;
  final String title;
  final String subtitle;

  EntitiesByProvincePage(
      {Key? key,
      required this.primaryColor,
      required this.secondaryColor,
      required this.primarySwatch,
      required this.entitiesByProvinceJson,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  _EntitiesByProvincePageState createState() => _EntitiesByProvincePageState();
}

class _EntitiesByProvincePageState extends State<EntitiesByProvincePage> {
  int selected = -1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => injector<EntitiesByProvinceCubit>()
          ..getEntitiesByProvince(widget.entitiesByProvinceJson),
        child: Theme(
          data: ThemeData(
              primaryColor: widget.primaryColor,
              accentColor: widget.secondaryColor,
              primarySwatch: widget.primarySwatch),
          child: Scaffold(
            appBar: AppBar(
                elevation: 0,
                title: AppBarTitleSubtitle(
                  title: widget.title,
                  subtitle: widget.subtitle,
                )),
            body: BlocBuilder<EntitiesByProvinceCubit, EntitiesByProvinceState>(
                builder: (context, state) {
              return ListView(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    color: Theme.of(context).primaryColor,
                    child: Icon(Icons.account_balance_outlined,
                        color: Colors.white, size: 90),
                  ),
                  if (state.loading)
                    Container(
                        height: 200,
                        child: Center(child: CircularProgressIndicator())),
                  if (state.entitiesByProvince.isNotEmpty)
                    ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.all(16),
                        itemCount: state.entitiesByProvince.length,
                        itemBuilder: (context, index) {
                          return _buildEntitiesListByProvince(
                              context, state.entitiesByProvince[index], index);
                        }),
                ],
              );
            }),
          ),
        ));
  }

  _buildEntitiesListByProvince(
      BuildContext context, ProvinceModel provinceModel, int index) {
    final GlobalKey expansionTileKey = GlobalKey();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          key: expansionTileKey,
          initiallyExpanded: index == selected,
          collapsedTextColor: Colors.transparent,
          leading: Icon(Icons.account_balance_outlined,
              color: Theme.of(context).accentColor, size: 25),
          title: Text(
            provinceModel.provinceName!,
            style: TextStyle(
                fontSize: kNormalTextSize,
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.w500),
          ),
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: provinceModel.entitiesList!.length,
                itemBuilder: (context, index) {
                  return EntityItem(
                      entity: provinceModel.entitiesList![index],
                      colorIcons: Theme.of(context).accentColor);
                })
          ],
          onExpansionChanged: ((newState) {
            if (newState)
              setState(() {
                selected = index;
              });
            else
              setState(() {
                selected = -1;
              });
          }),
        ),
      ),
    );
  }
}
