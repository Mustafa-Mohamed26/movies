import 'package:flutter/material.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/models/update_profile_request.dart';
import 'package:movies/utils/app_assets.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_routes.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/api_manager.dart' as ApiManager;

class UpdateProfile extends StatefulWidget {

   UpdateProfile({super.key,});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  String? selectedAvatar;
  List<String> avatars = [
    AppAssets.avatar_1,
    AppAssets.avatar_2,
    AppAssets.avatar_3,
    AppAssets.avatar_4,
    AppAssets.avatar_5,
    AppAssets.avatar_6,
    AppAssets.avatar_7,
    AppAssets.avatar_8,
    AppAssets.avatar_9,
  ];
  var email=TextEditingController(
      text: "mostafa123@gmail.com"

  );
  
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final avatarIdController = TextEditingController();

  String? token;


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.yellow),
          onPressed: () {

             Navigator.pop(context);
          },
        ),
        title: Text(
          "Pick Avatar",
          style: AppStyles.regular16yellow,
        ),
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: width*0.02
        ),
        child: Container(
          margin: EdgeInsets.symmetric(
            vertical: height*0.035,
            horizontal: width*0.001,


          ),
          child: Column(
            children: [
              GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: width*0.02
                      ),
                      height: 410,
                      color: AppColors.grey,
                      child: GridView.builder(
                        itemCount: avatars.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                         setState(() {
                           selectedAvatar = avatars[index];
                         });

                         Navigator.pop(context);
                         },
                            child: Image.asset(avatars[index],),

                          );
                          },
                      ),);
                    },);
                },
                child: CircleAvatar(
                  radius: width * 0.17,
                  backgroundColor: AppColors.black,
                  child: selectedAvatar != null
                      ? Image.asset(
                    selectedAvatar!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  )
                      : Image.asset(
                    AppAssets.avatarGamer,
                    fit: BoxFit.cover,
                  ),
                ),
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
                  hintText: "Phone Number",
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
                    Navigator.of(context).pushNamed(AppRoutes.resetPassword);
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
                  onPressed: () async{
                    // TODO: Delete Account Logic
                    try {
                      final result = await deleteProfile();

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(result.message)),
                      );

                      Navigator.pushReplacementNamed(context, "/login");

                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("فشل الحذف: $e")),
                      );
                    }
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
                    onPressed: () async {
                      try {
                        final request = UpdateProfileRequest(
                          email: emailController.text,
                          phone: phoneController.text,
                          name: nameController.text,
                          avatarId: avatarIdController.text,
                        );

                        final response = await updateProfile(token, request);

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(response.message)),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Error updating profile: $e")),
                        );
                      }
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