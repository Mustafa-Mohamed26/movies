import 'package:flutter/material.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/models/update_profile_request.dart';
import 'package:movies/utils/app_assets.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';

import '../../../l10n/app_localizations.dart';

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

             Navigator.pop(context);
          },
        ),
        title: Text(
          AppLocalizations.of(context)!.pick_avatar,
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
                    AppLocalizations.of(context)!.reset_password,
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
                  onPressed: () async{
                    // TODO: Delete Account Logic
                    try {
                      final result = await ApiManager.deleteProfile();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(result.message)),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("خطأ: $e")),
                      );
                    }
                  },
                  child: Text(
                    AppLocalizations.of(context)!.delete_account,
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
                  onPressed: () async{
                    // todo: Update Data Logic
                    try {
                      final result = await ApiManager.updateProfile(
                        UpdateProfileRequest(
                          name: "john safwat",
                          phone: "0100000000",
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(result.message)),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("خطأ: $e")),
                      );
                    }
                  },
                  child: Text(
                      AppLocalizations.of(context)!.update_data,
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
