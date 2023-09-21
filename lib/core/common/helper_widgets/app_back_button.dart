import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/color_manager.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.sp),
      padding: EdgeInsets.all(8.sp),
      decoration: BoxDecoration(
          color: ColorManager.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: ColorManager.black.withOpacity(.13),
                blurRadius: 20.0
            )
          ]
      ),
      child: Icon(Icons.arrow_forward_ios,
        size: 16.sp,
        color: ColorManager.black,),
    );
  }
}
