import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/core/constants/dimens.dart';
import 'package:flutter_civix/src/injector.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/general/frequent_questions/cubit/frequent_questions_cubit.dart';
import 'package:flutter_civix/src/presentation/widgets/appbar_title.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_card.dart';

class FrequentQuestionsPage extends StatefulWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final MaterialColor primarySwatch;
  final String jsonFaq;
  final String subtitle;

  FrequentQuestionsPage(
      {Key? key,
      required this.primaryColor,
      required this.secondaryColor,
      required this.primarySwatch,
      required this.jsonFaq,
      required this.subtitle})
      : super(key: key);

  @override
  _FrequentQuestionsPageState createState() => _FrequentQuestionsPageState();
}

class _FrequentQuestionsPageState extends State<FrequentQuestionsPage> {
  int selected = -1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            injector<FrequentQuestionsCubit>()..getFaq(widget.jsonFaq),
        child: Theme(
          data: ThemeData(
              primaryColor: widget.primaryColor,
              accentColor: widget.secondaryColor,
              primarySwatch: widget.primarySwatch),
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: AppBarTitleSubtitle(
                  title: S.of(context).frequentQuestions,
                  subtitle: widget.subtitle),
            ),
            body: BlocBuilder<FrequentQuestionsCubit, FrequentQuestionsState>(
                builder: (context, state) {
              return ListView(
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    color: Theme.of(context).primaryColor,
                    child: Icon(Icons.question_answer_outlined,
                        color: Colors.white, size: 90),
                  ),
                  if (state.loading)
                    Container(
                        height: 200,
                        child: Center(child: CircularProgressIndicator())),
                  if (state.faqList.isNotEmpty)
                    ListView.builder(
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        padding: EdgeInsets.all(16),
                        itemCount: state.faqList.length,
                        itemBuilder: (context, indexFather) {
                          return _buildListFaq(context, state, indexFather);
                        }),
                ],
              );
            }),
          ),
        ));
  }

  _buildListFaq(
      BuildContext context, FrequentQuestionsState state, int indexFather) {
    final GlobalKey expansionTileKey = GlobalKey();

    return CustomCard(
      margin: EdgeInsets.symmetric(vertical: 6),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            key: expansionTileKey,
            initiallyExpanded: indexFather == selected,
            collapsedTextColor: Colors.transparent,
            leading: Icon(Icons.question_answer_outlined,
                color: Theme.of(context).accentColor, size: 25),
            title: Text(
              state.faqList[indexFather].question,
              style: TextStyle(
                  fontSize: kNormalTextSize,
                  color: Theme.of(context).accentColor,
                  fontWeight: FontWeight.w500),
            ),
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: state.faqList[indexFather].responsesList.length,
                  itemBuilder: (context, indexSon) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 8),
                      child: Text(
                          state.faqList[indexFather].responsesList[indexSon]
                              .text,
                          style: TextStyle(fontSize: kNormalTextSize)),
                    );
                  })
            ],
            onExpansionChanged: ((isExpanded) {
              if (isExpanded)
                setState(() {
                  selected = indexFather;
                });
              else
                setState(() {
                  selected = -1;
                });
            }),
          ),
        ),
      ),
    );
  }
}
