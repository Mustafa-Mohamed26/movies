import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/utils/app_styles.dart';

class CustomCard extends StatelessWidget {
  final String image;
  final double rate;
  final VoidCallback onTap; // ✅ callback function

  const CustomCard({
    super.key,
    required this.image,
    required this.rate,
    required this.onTap, // ✅ required callback
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return InkWell(
      borderRadius: BorderRadius.circular(20), // تأثير Ripple مع انحناء
      onTap: onTap, // ✅ استدعاء الدالة عند الضغط
      child: Container(
        width: width * 0.55,
        height: height * 0.35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // ظل خفيف
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            children: [
              // الصورة
              Positioned.fill(
                child: CachedNetworkImage(
                  imageUrl: image,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(
                      color: Colors.yellow, // أو أي لون مناسب
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.red),
                ),
              ),

              // Gradient خفيف فوق الصورة
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.4),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),

              // التقييم
              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: height * 0.003,
                    horizontal: width * 0.02,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black.withOpacity(0.5),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("$rate", style: AppStyles.regular16white),
                      Text(" ⭐", style: AppStyles.regular16white),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
