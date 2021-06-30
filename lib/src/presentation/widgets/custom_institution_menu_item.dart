import 'package:flutter/material.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_card.dart';
import 'package:flutter_civix/src/domain/entities/institution_menu_item.dart';

class CustomInstitutionMenuItem extends StatelessWidget {
  final InstitutionMenuItem info;
  final double? iconSize;
  final Function()? onTap;

  const CustomInstitutionMenuItem({Key? key, required this.info, this.iconSize, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.all(8),
              height: (iconSize != null) ? iconSize : 50,
              width: (iconSize != null) ? iconSize : 50,
              decoration: BoxDecoration(
                color: info.color.withOpacity(0.1),
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              // child: Image(image: Assets.images.marcaAguaFgr, color: info.color)),
              child: Icon(info.imageSrc, color: info.color)),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              info.title,
              maxLines: 2,
              overflow: TextOverflow.visible,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
