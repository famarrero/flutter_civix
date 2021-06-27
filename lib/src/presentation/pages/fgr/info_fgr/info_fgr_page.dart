import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/core/routes/routes.gr.dart';
import 'package:flutter_civix/src/domain/entities/institution_menu_item.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/consult_state_fgr/cubit/consult_state_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/list_statement_fgr/cubit/list_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/write_statement_fgr/cubit/write_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_grid_institution_options.dart';
import 'package:flutter_civix/src/presentation/widgets/headers.dart';

import '../main_fgr/main_fgr_page.dart';

class InfoFgrPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        // CustomCarouselSlider(items: _getItemsCarousel()),
        // SliverAppBar(
        //   floating: true,
        //   elevation: 0,
        //   backgroundColor: Theme.of(context).primaryColor,
        //   title: Text(S.of(context).fgr),
        //   actions: [
        //     IconButton(
        //         onPressed: () {},
        //         icon: const Icon(Icons.notifications)),
        //     IconButton(
        //         onPressed: () {},
        //         icon: const Icon(Icons.sync)),
        //     IconButton(
        //         icon: Icon(Icons.qr_code_scanner),
        //         onPressed: () {})
        //   ],
        // ),
        SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: SliverCustomHeaderDelegate(
                minheight: 140,
                maxheight: 180,
                child: Container(
                    alignment: Alignment.center,
                    color: Colors.transparent,
                    child: Stack(
                      children: [
                        HeaderWave(context, Color(0xff151a2e)),
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Row(
                              //   children: [
                              //     IconButton(
                              //         onPressed: () {
                              //           Navigator.of(context).pop();
                              //         },
                              //         icon: const Icon(Icons.arrow_back,
                              //             color: Colors.white)),
                              //     Spacer(),
                              //     IconButton(
                              //         onPressed: () {},
                              //         icon: const Icon(
                              //             Icons.notifications,
                              //             color: Colors.white)),
                              //     IconButton(
                              //         onPressed: () {},
                              //         icon: const Icon(Icons.sync,
                              //             color: Colors.white)),
                              //     IconButton(
                              //         icon: Icon(Icons.qr_code_scanner,
                              //             color: Colors.white),
                              //         onPressed: () {})
                              //   ],
                              // ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SizedBox(width: 24),
                                  Image(
                                      height: 100,
                                      width: 100,
                                      color: Colors.white,
                                      image: Assets.images.marcaAguaFgr),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16),
                                      child: Text(
                                        S.of(context).fgr,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.w300),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    )))),
        SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: SliverCustomHeaderDelegate(
                minheight: 20,
                maxheight: 20,
                child: Container(
                  child: Center(
                      child: Text('Información',
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w300))),
                ))),

        SliverPadding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 16),
          sliver: InstitutionOptionsSliver(
            items: _getItemsInstitutionOptions(context),
          ),
        )
      ],
    );
  }

  List<InstitutionMenuItem> _getItemsInstitutionOptions(BuildContext context) {
    return [
      InstitutionMenuItem(
          imagSrc: Icons.question_answer_outlined,
          title: "Frecuents questions",
          color: Colors.blue,
          onTap: () {
            print('Frecuents questions');
          }),
      InstitutionMenuItem(
          imagSrc: Icons.house_outlined,
          title: "About us",
          color: Colors.blue,
          onTap: () {
            print('About us');
          }),
      InstitutionMenuItem(
          imagSrc: Icons.phone_outlined,
          title: "Contact",
          color: Colors.blue,
          onTap: () {
            print('Contact');
          }),
    ];
  }
}
