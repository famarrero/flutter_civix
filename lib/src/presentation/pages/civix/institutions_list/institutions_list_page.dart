import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/constants/dimens.dart';
import 'package:flutter_civix/src/core/routes/routes.gr.dart';
import 'package:flutter_civix/src/core/utils/responsive.dart';
import 'package:flutter_civix/src/domain/entities/institution_item.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_card.dart';

class InstitutionsListPage extends StatelessWidget {
  const InstitutionsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(padding: EdgeInsets.all(16), children: <Widget>[
      InstitutionsListOptions(
        items: _getItemsInstitutionOptions(context),
      )
    ]);
  }

  List<InstitutionItem> _getItemsInstitutionOptions(BuildContext context) {
    return [
      InstitutionItem(
          imageSrc: Assets.images.logoFgr.path,
          title: S.of(context).fgr,
          color: Colors.blue,
          onTap: () {
            AutoRouter.of(context).push(MainFgrPageRoute());
          }),
      InstitutionItem(
          imageSrc: Assets.images.logoTsp.path,
          title: S.of(context).tsp,
          color: Colors.blue,
          onTap: () {
            AutoRouter.of(context).push(MainTspPageRoute());
          }),
      InstitutionItem(
          imageSrc: Assets.images.logoOnbc.path,
          title: S.of(context).onbc,
          color: Colors.blue,
          onTap: () {
            AutoRouter.of(context).push(MainOnbcPageRoute());
          }),
      InstitutionItem(
          imageSrc: Assets.images.logoMinjus.path,
          title: "Ministerio de Justicia",
          color: Colors.blue,
          onTap: () {}),
      InstitutionItem(
          imageSrc: Assets.images.logoFgr.path,
          title: "Ministerio de Educación Popular",
          color: Colors.blue,
          onTap: () {}),
      InstitutionItem(
          imageSrc: Assets.images.logoAnpp.path,
          title: "Asamblea Nacional del Poder Popular",
          color: Colors.blue,
          onTap: () {}),
      InstitutionItem(
          imageSrc: Assets.images.logoInder.path,
          title: "Instituto Nacional de Deporte y Recreación",
          color: Colors.blue,
          onTap: () {}),
    ];
  }
}

class InstitutionsListOptions extends StatelessWidget {
  final List<InstitutionItem> items;

  const InstitutionsListOptions({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: kDefaultPadding),
        Responsive(
          mobile: InstitutionsListOptionsGrid(
            items: items,
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.3 : 1,
          ),
          tablet: InstitutionsListOptionsGrid(
            items: items,
          ),
          desktop: InstitutionsListOptionsGrid(
            items: items,
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class InstitutionsListOptionsGrid extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;
  final List<InstitutionItem> items;

  const InstitutionsListOptionsGrid({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        // childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => Material(
        color: Colors.transparent,
        child: CustomCard(
          onTap: items[index].onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.all(8),
                  height: 80,
                  width: 80,
                  // decoration: BoxDecoration(
                  //   color: items[index].color.withOpacity(0.1),
                  //   borderRadius: const BorderRadius.all(Radius.circular(10)),
                  // ),
                  child: Image.asset(items[index].imageSrc)),
              SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(
                  items[index].title,
                  maxLines: 2,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
