import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/injector.dart';
import 'package:flutter_civix/src/presentation/pages/general/entities_list/cubit/entities_list_cubit.dart';
import 'package:flutter_civix/src/presentation/widgets/appbar_title.dart';
import 'package:flutter_civix/src/presentation/widgets/entity_item.dart';

class EntitiesListPage extends StatefulWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final MaterialColor primarySwatch;
  final String entitiesByProvinceJson;
  final String title;
  final String subtitle;

  EntitiesListPage(
      {Key? key,
      required this.primaryColor,
      required this.secondaryColor,
      required this.primarySwatch,
      required this.entitiesByProvinceJson,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  _EntitiesListPageState createState() => _EntitiesListPageState();
}

class _EntitiesListPageState extends State<EntitiesListPage> {
  int selected = -1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => injector<EntitiesListCubit>()
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
            body: BlocBuilder<EntitiesListCubit, EntitiesListState>(
                builder: (context, state) {
              return ListView(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    color: Theme.of(context).primaryColor,
                    child: Icon(Icons.account_balance_outlined,
                        color: Colors.white, size: 60),
                  ),
                  if (state.loading)
                    Container(
                        height: 200,
                        child: Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor))),
                  if (state.entitiesList.isNotEmpty)
                    ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.all(16),
                        itemCount: state.entitiesList.length,
                        itemBuilder: (context, index) {
                          return EntityItem(
                              entity: state.entitiesList[index],
                              colorIcons: Theme.of(context).accentColor);
                        }),
                ],
              );
            }),
          ),
        ));
  }
}
