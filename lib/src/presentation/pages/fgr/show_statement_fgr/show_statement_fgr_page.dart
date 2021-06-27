import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/core/constants/colors.dart';
import 'package:flutter_civix/src/domain/entities/fgr/statement_fgr.dart';
import 'package:flutter_civix/src/injector.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/show_statement_fgr/cubit/show_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/show_statement_fgr/widgets/show_promoters.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_card.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_container_state.dart';
import 'package:flutter_civix/src/presentation/widgets/show_files_widget.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShowStatementFgrPage extends StatelessWidget {
  final String id;

  const ShowStatementFgrPage({required this.id});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          primaryColor: kFgrPrimaryColor,
          accentColor: kFgrSecondaryColor,
          primarySwatch: kFgrPrimaryMaterialColor),
      child: Scaffold(
          appBar: _buildAppBar(context),
          body: BlocProvider(
              create: (context) => injector<ShowStatementFgrCubit>()..getStatementFGRById(id),
              child: BlocBuilder<ShowStatementFgrCubit, ShowStatementFgrState>(
                  builder: (context, state) {
                if (state.error != null) {
                  return Container();
                } else if (state.statementsFgr != null) {
                  return _buildFutureStatement(state.statementsFgr);
                } else
                  return Center(child: Text('Something wrong'));
              }))),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(S.of(context).statement),
          SizedBox(height: 4),
          Text(S.of(context).fgr, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300)),
        ],
      ),
      actions: [
        IconButton(
          tooltip: S.of(context).saveEraser,
          icon: Icon(Icons.delete),
          onPressed: () {},
        ),
      ],
    );
  }

  _buildFutureStatement(StatementFGR? statementsFgr) {
    Color colorState = Colors.green;
    String textState = 'En tramitación';
    AssetGenImage institutionLogo = Assets.images.marcaAguaFgr;

    if (statementsFgr != null) {
      return ListView(
        children: [
          _firstCard(colorState, textState, statementsFgr, institutionLogo),
          _secondCard(statementsFgr),
          if (statementsFgr.promoters != null && statementsFgr.promoters!.isNotEmpty)
            ShowPromoters(promoters: statementsFgr.promoters!, colorIcons: kFgrSecondaryColor),
          _responseCard(statementsFgr),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ShowFiles(files: statementsFgr.files!, buttonDeleteIsVisible: false),
          ),
        ],
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.sadTear, size: 50, color: Colors.black45),
            SizedBox(height: 20),
            Text('Upss, no hay planteamiento!', style: TextStyle(fontSize: 16))
          ],
        ),
      );
    }
  }

  _firstCard(
      Color colorState, String textState, StatementFGR statement, AssetGenImage institutionLogo) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: CustomCardTopRightCorner(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomContainerState(textState: textState, colorState: colorState),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.vpn_key,
                            color: kFgrSecondaryColor,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(statement.ticked!,
                                style: TextStyle(color: Colors.black, fontSize: 16)),
                          ),
                          // Icon(
                          //   Icons.copy,
                          //   color: Colors.blue,
                          // ),
                          SizedBox(width: 20),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.date_range,
                            color: kFgrSecondaryColor,
                          ),
                          SizedBox(width: 10),
                          Text('07/06/21', style: TextStyle(color: Colors.black, fontSize: 16)),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.phone_android,
                            color: kFgrSecondaryColor,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text('Reception way  Civix',
                                style: TextStyle(color: Colors.black, fontSize: 16)),
                          ),
                        ],
                      ),
                      SizedBox(height: 16)
                    ],
                  ),
                ),
                Image(image: institutionLogo),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _secondCard(StatementFGR statement) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: CustomCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Subject',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                Icon(
                  Icons.short_text,
                  color: kFgrSecondaryColor,
                ),
                SizedBox(width: 10),
                Expanded(
                  child:
                      Text(statement.subject!, style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Statement',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 10),
                Icon(
                  Icons.wrap_text,
                  color: kFgrSecondaryColor,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(statement.statement!,
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  _responseCard(StatementFGR statement) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: CustomCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('Response',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.7),
                      fontSize: 16,
                      fontWeight: FontWeight.bold)),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(width: 10),
                Icon(
                  Icons.wrap_text,
                  color: kFgrSecondaryColor,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                      'This is a anwser fomr teh babsa d h dasbe fosnf h dsdhs las ejs  sdlsjs sis ds disds dskdbs  dsdeif  skywkdbgdiresmds die eodskds.',
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 16)
          ],
        ),
      ),
    );
  }
}




  // _buildStreamStatement(Stream<StatementFGR?> statementsFgr) {
  //   Color colorState = Colors.green;
  //   String textState = 'En tramitación';
  //   AssetGenImage institutionLogo = Assets.images.marcaAguaFgr;
  //   return StreamBuilder(
  //     stream: statementsFgr,
  //     builder: (context, AsyncSnapshot<StatementFGR?> snapshot) {
  //       if (snapshot.hasData) {
  //         StatementFGR? statement = snapshot.data;
  //         if (statement != null) {
  //           return ListView(
  //             children: [
  //               _firstCard(colorState, textState, statement, institutionLogo),
  //               _secondCard(statement),
  //               _responseCard(statement),
  //               ShowFiles(files: statement.files!, buttonDeleteIsVisible: false),
  //               // FutureBuilder<List<File>>(
  //               //   future: _checkIfFilesExists(statement.files!),
  //               //   builder: (BuildContext context,
  //               //       AsyncSnapshot<List<File>> snapshot) {
  //               //     if (snapshot.data != null)
  //               //       return ShowFiles(
  //               //           files: snapshot.data!, buttonDeleteIsVisible: false);
  //               //     else
  //               //       return Container();
  //               //   },
  //               // ),
  //             ],
  //           );
  //         } else {
  //           return Center(
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Icon(FontAwesomeIcons.sadTear, size: 50, color: Colors.black45),
  //                 SizedBox(height: 20),
  //                 Text('Upss, no hay planteamiento!', style: TextStyle(fontSize: 16))
  //               ],
  //             ),
  //           );
  //         }
  //       } else {
  //         return Center(child: CircularProgressIndicator());
  //       }
  //     },
  //   );
  // }