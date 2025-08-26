import 'package:flutter/material.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';


class CustomRank extends StatelessWidget {
   String rank;
   String? icon;
  TextStyle? textStyle;

   CustomRank({
    super.key,
    required this.rank,
    this.icon,
    this.textStyle,});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.01,
      ),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null && icon!.isNotEmpty) ...[
            Image.asset(icon!), 
            SizedBox(width: width * 0.03),
          ],
          Text(rank, style: textStyle ?? AppStyles.bold24white , textAlign: TextAlign.start,),
        ],
      ),
    );
  }
}
