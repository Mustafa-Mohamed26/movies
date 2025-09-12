import 'package:flutter/material.dart';

import '../../../utils/app_styles.dart';
class GenreTapIcon extends StatelessWidget {
  bool isSlected;
  String eventName;
  Color colorSlect;
  Color colorSlectText;
  Color colorUnSlectText;
  Color borderColor;
  GenreTapIcon({
    super.key,
    required this.isSlected,
    required this.eventName,
    required this.colorSlect,
    required this.colorSlectText,
    required this.colorUnSlectText,
    required this.borderColor

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:EdgeInsets.symmetric(horizontal: 3),
      padding: EdgeInsets.symmetric(horizontal: 7,vertical: 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSlected?colorSlect:Colors.transparent,
          border:Border.all(
              color: borderColor,
              width: 2
          )
      ),
      child: Text(eventName,style: isSlected?AppStyles.medium36white.copyWith(fontSize: 16,color: colorSlectText)
          :AppStyles.medium36white.copyWith(fontSize: 16,color: colorUnSlectText)
        ,),
    );
  }
}
