import 'package:flutter/material.dart';
import 'package:movies/utils/app_assets.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.yellow),
          onPressed: () {

            //todo: Navigator.pop(context);
          },
        ),
        title: Text(
          "Pick Avatar",
          style: AppStyles.regular16yellow,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: height*0.035,
            horizontal: width*0.001,


          ),
          child: Column(
            children: [
              // Avatar
              CircleAvatar(
                radius: width*0.17,
                backgroundColor: AppColors.grey,
                child: Image.asset(AppAssets.avatarGamer),

              ),
              SizedBox(height: height*0.03),


              TextField(
                style: TextStyle(color: AppColors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, color: Colors.white),
                  hintText: "John Safwat",

                  hintStyle: AppStyles.regular20white,
                  filled: true,
                  fillColor: AppColors.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              SizedBox(height: height*0.02),

              TextField(
                style: TextStyle(color: AppColors.white),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone, color: AppColors.white),
                  hintText: "01200000000",
                  hintStyle: AppStyles.regular20white,
                  filled: true,
                  fillColor: AppColors.grey,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),

              SizedBox(height: height*0.01),

              // Reset Password
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    // todo: forget password
                  },
                  child: Text(
                    "Reset Password",
                    style: AppStyles.regular20white,
                  ),
                ),
              ),

              Spacer(),

              // Delete Account
              Container(
                height: height*0.063,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.red,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextButton(
                  onPressed: () {
                    // TODO: Delete Account Logic
                  },
                  child: Text(
                    "Delete Account",
                    style: AppStyles.regular20white,
                  ),
                ),
              ),

              SizedBox(height: height*0.02),

              // Update Data
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: height*0.01
                ),
                height: height*0.063,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: TextButton(
                  onPressed: () {
                    // todo: Update Data Logic
                  },
                  child: Text(
                      "Update Data",
                      style: AppStyles.regular20black
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
