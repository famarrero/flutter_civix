import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/domain/entities/fgr/statement_fgr.dart';
import 'package:flutter_civix/src/injector.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/show_statement_fgr/cubit/show_statement_fgr_cubit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShowStatementFgrPage extends StatelessWidget {
  final String id;

  const ShowStatementFgrPage({
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<ShowStatementFgrCubit>()..watchStatementFGRById(id),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: _buildBody(context),
      ),
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

  _buildBody(BuildContext context) {
    return BlocBuilder<ShowStatementFgrCubit, ShowStatementFgrState>(builder: (context, state) {
      if (state.error != null) {
        return Container();
      } else {
        return _buildStreamStatement(state.statmentsFgr);
      }
    });
  }

  StreamBuilder<StatementFGR?> _buildStreamStatement(Stream<StatementFGR?> statmentsFgr) {
    Color colorState = Colors.green;
    String textState = 'En tramitación';
    AssetGenImage institutionLogo = Assets.images.marcaAguaFgr;
    return StreamBuilder(
      stream: statmentsFgr,
      builder: (context, AsyncSnapshot<StatementFGR?> snapshot) {
        if (snapshot.hasData) {
          StatementFGR? statement = snapshot.data;
          if (statement != null) {
            return Column(
              children: [
                _firstCard(colorState, textState, statement, institutionLogo),
                _secondCard(statement),
                _responseCard(statement),
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
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  _firstCard(
      Color colorState, String textState, StatementFGR statement, AssetGenImage institutionLogo) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(50),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: colorState,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20), topRight: Radius.circular(50))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 15),
                  Expanded(
                    child: Text(textState,
                        style: TextStyle(
                            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 16),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.vpn_key,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(statement.tiked!,
                                style: TextStyle(color: Colors.black, fontSize: 16)),
                          ),
                          Icon(
                            Icons.copy,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 20),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.date_range,
                            color: Colors.blue,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text('07/06/21',
                                style: TextStyle(color: Colors.black, fontSize: 16)),
                          ),
                        ],
                      ),
                      SizedBox(height: 16)
                    ],
                  ),
                ),
                Image(image: institutionLogo),
                SizedBox(width: 5),
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
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Expanded(
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
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 10),
                  Icon(
                    Icons.short_text,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(statement.subject!,
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text('Statment',
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
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(statement.statement!,
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }

  _responseCard(StatementFGR statement) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Expanded(
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
                    color: Colors.blue,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text('No response yet!',
                        style: TextStyle(color: Colors.black, fontSize: 16)),
                  ),
                  SizedBox(width: 10),
                ],
              ),
              SizedBox(height: 16)
            ],
          ),
        ),
      ),
    );
  }
}
