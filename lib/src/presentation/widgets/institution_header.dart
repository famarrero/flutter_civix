import 'package:flutter/material.dart';
import 'package:flutter_civix/src/presentation/widgets/headers.dart';

class InstitutionHeader extends StatelessWidget {
  final String institutionName;
  final Color color;
  final String image;

  const InstitutionHeader(
      {Key? key,
      required this.institutionName,
      required this.color,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140,
        alignment: Alignment.center,
        color: Colors.transparent,
        // color: Color(0xff1f2749),
        child: Stack(
          children: [
            HeaderWave(context, color),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // SizedBox(height: 8),
                  Row(
                    children: [
                      SizedBox(width: 24),
                      Image.asset(
                        image,
                        height: 90,
                        width: 90,
                        color: Colors.white,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            institutionName,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
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
        ));
  }
}
