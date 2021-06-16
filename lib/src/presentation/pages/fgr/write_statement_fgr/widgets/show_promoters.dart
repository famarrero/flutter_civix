import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_civix/src/domain/entities/fgr/promoter_fgr.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_civix/src/presentation/app/lang/l10n.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/write_statement_fgr/cubit/write_statement_fgr_cubit.dart';
import 'package:flutter_civix/src/presentation/pages/fgr/write_statement_fgr/widgets/add_edit_promoter_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ShowPromoters extends StatelessWidget {
  final BuiltList<PromoterFRG> _promoters;

  ShowPromoters(this._promoters);

  @override
  Widget build(BuildContext context) {
    // var form =
    //     BlocProvider.of<WriteStatementFgrCubit>(blocContext).getProvinces;
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 4),
        itemCount: _promoters.length,
        itemBuilder: (BuildContext context, int index) {
          String title = '';
          if (_promoters[index].firstName != null && _promoters[index].firstName!.isNotEmpty) {
            title = '${_promoters[index].firstName} ';
          }
          if (_promoters[index].firstLastName != null &&
              _promoters[index].firstLastName!.isNotEmpty) {
            title += '${_promoters[index].firstLastName!}';
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Icon(FontAwesomeIcons.addressBook, size: 25, color: Colors.blue),
                SizedBox(width: 18),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (title != '')
                        Text(title, style: TextStyle(fontSize: 14, color: Colors.black54)),
                      SizedBox(height: 2),
                      Text(
                          '${_promoters[index].municipalityName}, ${_promoters[index].provinceName}',
                          style: TextStyle(fontSize: 14, color: Colors.black54)),
                    ],
                  ),
                ),
                InkWell(
                  child: Icon(FontAwesomeIcons.edit, size: 25, color: Colors.blue),
                  onTap: () {
                    showDialog<void>(
                        context: context,
                        builder: (BuildContext dialogContext) => AddEditPromoterDialog(
                            blocContext: context,
                            title: S.of(context).editPromoter,
                            isEdit: true,
                            index: index));
                  },
                ),
                SizedBox(width: 10),
                InkWell(
                  child: Icon(FontAwesomeIcons.trash, size: 25, color: Colors.red),
                  onTap: () {
                    BlocProvider.of<WriteStatementFgrCubit>(context, listen: false)
                        .deletePromoter(index);
                  },
                )
              ],
            ),
          );
        });
  }
}