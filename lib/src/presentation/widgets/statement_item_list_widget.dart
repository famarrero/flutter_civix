import 'package:flutter/material.dart';
import 'package:flutter_civix/src/domain/entities/fgr/statement_fgr.dart';
import 'package:flutter_civix/src/presentation/app/assets/assets.gen.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_card.dart';
import 'package:flutter_civix/src/presentation/widgets/custom_container_state.dart';

class StatementItemListWidget extends StatelessWidget {
  final StatementFGR statement;

  const StatementItemListWidget({
    required this.statement,
  });

  @override
  Widget build(BuildContext context) {
    return _buildBody(statement);
  }

  _buildBody(StatementFGR statement) {
    Color colorState = Colors.green;
    String textState = 'En tramitación';
    AssetGenImage institutionLogo = Assets.images.marcaAguaFgr;

    if (statement.tiked!.startsWith('a')) {
      colorState = Colors.blue;
      textState = 'En proceso';
    }
    if (statement.tiked!.startsWith('b')) {
      colorState = Colors.red;
      textState = 'Anulado';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: CustomCardTopRightCorner(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomContainerState(textState: textState, colorState: colorState),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
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
                          SizedBox(width: 10),
                        ],
                      ),
                      SizedBox(height: 10),
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
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
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
                      SizedBox(height: 15)
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
}
