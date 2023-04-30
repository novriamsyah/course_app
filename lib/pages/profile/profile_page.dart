import 'package:e_learning_app/common/values/constant.dart';
import 'package:e_learning_app/pages/profile/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var imageUrlData = <String, String>{
    "Settings": "settings.png",
    "Payment Detail": "credit-card.png",
    "Achievement": "award.png",
    "Love": "heart(1).png",
    "Reminders": "cube.png",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: customAppbar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: Column(
            children: [
              const CustomProfilePhoto(
                urlImage:
                    "https://static.vecteezy.com/system/resources/previews/010/871/103/original/3d-avatar-dj-png.png",
                userName: "Amsyah Novri",
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomButtonProfile(
                      imageUrl: "assets/icons/profile_video.png",
                      title: "My Courses",
                    ),
                    CustomButtonProfile(
                      imageUrl: "assets/icons/profile_book.png",
                      title: "Buy Courses",
                    ),
                    CustomButtonProfile(
                      imageUrl: "assets/icons/profile_star.png",
                      title: "4.9",
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 35.h),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  children: List.generate(imageUrlData.length, (index) {
                    var valueImage = imageUrlData.values.elementAt(index);
                    var valueTitle = imageUrlData.keys.elementAt(index);
                    return CustomMenuListProfile(
                      context: context,
                      title: valueTitle,
                      imageUrl: valueImage,
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
