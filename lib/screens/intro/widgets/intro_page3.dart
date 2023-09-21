import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_string.dart';
import '../../../core/utils/assets_manager.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({
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
          child: Image.asset(AssetsManager.introImg3IMG),
        ),
        Padding(
          padding:  EdgeInsets.all(36.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100.h,),
              SvgPicture.asset(AssetsManager.introTitle3IMG),
              SizedBox(height: 30.sp,),
              Text(AppString.introSubTitle3,textAlign: TextAlign.center,
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
