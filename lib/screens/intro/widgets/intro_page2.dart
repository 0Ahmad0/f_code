import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/utils/app_string.dart';
import '../../../core/utils/assets_manager.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding:  EdgeInsets.only(
              top: 40.sp
          ),
          child: Image.asset(AssetsManager.introImg2IMG),
        ),
        Padding(
          padding:  EdgeInsets.all(36.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height / 2.25,),
              SvgPicture.asset(AssetsManager.introTitle2IMG),
              SizedBox(height: 30.sp,),
              Text(AppString.introSubTitle2,textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
