import 'package:flutter/material.dart';
import 'package:flutter_civix/src/core/constants/constants.dart';
import 'package:flutter_civix/src/core/utils/responsive.dart';
import 'package:flutter_civix/src/domain/entities/institution_menu_item.dart';

import 'cutom_institution_menu_item.dart';

class InstitutionOptions extends StatelessWidget {
  final List<InstitutionMenuItem> items;

  const InstitutionOptions({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: Constants.defaultPadding),
        Responsive(
          mobile: IntitutionOptionsGrid(
            items: items,
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.3 : 1,
          ),
          tablet: IntitutionOptionsGrid(
            items: items,
          ),
          desktop: IntitutionOptionsGrid(
            items: items,
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class IntitutionOptionsGrid extends StatelessWidget {
  final int crossAxisCount;
  final double childAspectRatio;
  final List<InstitutionMenuItem> items;

  const IntitutionOptionsGrid({
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
        child: InkWell(
          child: CutomInstitutionMenuItem(info: items[index]),
          onTap: items[index].onTap,
        ),
      ),
    );
  }
}
